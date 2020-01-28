module Texting

using Main.Secrets
using Main.Patients
using PyCall


rest = pyimport("twilio.rest")
client = rest.Client(Secrets.session_id, Secrets.auth_token)

test_sms() = client.messages.create(
  body = msgs()["help"],
  from_ = trial_number,
  to = "+15038106415")

test_mms(MRN::Int) = client.messages.create(
  body = "This is a test MMS!",
  from_ = trial_number,
  media_url=["$ngrok_address/patient_plots/$MRN"],
  to = "+15038106415")


function extract_score(body, scores=[])
  for char in body
    try char = parse(Int, char)
      append!(scores, char) catch end end
  return scores
end

function start_texting_service(ngrok_address::String)
  while true
    for p in all(Patients.Patient)
      if awaiting_sms_routine(p) == true
        @async dispatch_sms_routine(p, ngrok_address) end end
    sleep(600)
end end

function awaiting_sms_routine(p::Patients.Patient)
end

function dispatch_sms_routine(p::Patients.Patient)
end


end

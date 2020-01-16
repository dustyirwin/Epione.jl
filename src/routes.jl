using Genie.Router
using Main.PatientsController

MessagingResponse = pyimport("twilio.twiml.messaging_response")

route("/") do
  serve_static_file("welcome.html")
end

route("/patients", PatientsController.patient_list)

route("/sum/:x::Int/:y::Int") do
    @params(:x) + @params(:y)
end

route("/echo/:message") do
    @params(:message)
end


route("/sms", method=POST) do
    body = replace(Genie.Requests.payload(:Body), "+"=>" ")
    score = join(extract_score(body))
    from = Genie.Requests.payload(:From)
    first_name = get_first_name_from_phone_number(from)

    client.messages.create(
        body = "Thanks $(first_name)! You reported a score of $score.",
        from_ = trial_number,
        to = "+15038106415")
end

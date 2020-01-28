@time include("./custom_boot.jl")


SearchLight.Migration.status()
SearchLight.Migration.last_up()

Patients.Patient(first_name="Oprah", last_name="Winfrey", MRN=5) |> save!

timestamp = ceil(now(), Second(1))
MRN = 1
Sleeps.Sleep(MRN=MRN, date=string(timestamp), hours=6.5) |> save!
Depressions.Depression(MRN=MRN, date=string(timestamp), score=3.5) |> save!

test_sms()
test_mms(2)


all(Patients.Patient)

client.messages.create(
  body = "This is a test MMS!",
  from_ = trial_number,
  media_url=["$ngrok_address/patient_plots/$MRN"],
  to = "+15038106415")



function read_text(p::Patients.Patient, text_body::String)
  score = try parse(Int, join(extract_score(body))) catch; false end

  if occursin("epi_help", lowercase(text_body))
    client.messages.create(
      body = msgs(p)["help"],
      from_ = trial_number,
      to = "+15038106415")

  elseif score !== false
    client.messages.create(
      body = "Thanks $(p.first_name)! You reported a value of $score.",
      from_ = trial_number,
      to = "+15038106415")
    client.messages.create(
      body = "$(p.first_name) $(p.last_name) has updated their mood chart!",
      from_ = trial_number,
      media_url=["$ngrok_address/patient_plots/$(p.MRN)"],
      to = "+15038106415")
end end

pat = findone(Patients.Patient, MRN=2)

read_text(pat, "10")

score = parse(Int, join(extract_score("i feel like a 10!")))

MRN=2

sleeps = [(s.date, s.hours) for s in find(Sleeps.Sleep, MRN=MRN)]
plot(sleeps)

ngrok_address
PatientsController.patient_list()
q = PatientsController.get_patient_plot_by_MRN(2)
savefig(q, "./public/plots/1.png")

pats = 20
time_to_process_manually_in_mins = 3.5
labor_cost_per_min = 25/60
outreach_days_per_month = 30.5
cost_savings = pats *
  time_to_process_manually_in_mins *
  labor_cost_per_min *
  outreach_days_per_month

labor_cost_savings_per_month_per_pat = cost_savings / pats

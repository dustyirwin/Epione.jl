using Genie.Router
using Main.PatientsController

route("/") do
  serve_static_file("welcome.html")
end

route("/patients", PatientsController.patient_list)

route("/sum/:x::Int/:y::Int") do
    @params(:x) + @params(:y)
end

route("/patient_plots/:MRN") do
  plt = PatientsController.get_patient_plot_by_MRN(parse(Int, @params(:MRN)))
  savefig(plt, "./public/plots/$(@params(:MRN)).png")
  serve_static_file("/plots/$(@params(:MRN)).png")
end

route("/sms", method=POST) do
  from = Genie.Requests.payload(:From)
  p = get_patient_data_by_phone_number(from)

  body = replace(Genie.Requests.payload(:Body), "+"=>" ")
  score = join(extract_score(body))

  client.messages.create(
    body = "Thanks $(p.first_name)! You reported a value of $score.",
    from_ = trial_number,
    to = "+15038106415")

  client.messages.create(
      body = "$(p.first_name) $(p.last_name) has updated their mood chart!",
      from_ = trial_number,
      media_url=["http://c6d5b0cb.ngrok.io/patient_plots/$(p.MRN)"],
      to = "+15038106415")
end

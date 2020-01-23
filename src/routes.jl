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

route("/incoming_text", method=POST) do
  from = Genie.Requests.payload(:From)
  p = SearchLight.findone(Patients.Patient, phone1=from[3:end])
  body = replace(Genie.Requests.payload(:Body), "+"=>" ")

  read_text(p, body)
end

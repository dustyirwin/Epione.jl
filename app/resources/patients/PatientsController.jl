module PatientsController

using Main.Patients: Patient
using Main.Sleeps: Sleep
using Main.Depressions: Depression

using Genie.Renderer
using Genie.Renderer.Html
using SearchLight
using Plots

export get_patient_plot_by_MRN

function patient_list()
  pats = [p for p in all(Patient)]
  "<h1>Patient Info:</h1>
  <ul>$(["<li>$(p.first_name) $(p.last_name) $(p.phone1)</li>" for p in pats]...)</ul>"
end

function patient_list_html()
  html(:patients, :patient_list, patients=[p for p in all(Patient)])
end

function get_patient_plot_by_MRN(MRN::Int, first_name="", last_name="")
  patient = findone(Patient, MRN=MRN)
  sleeps = [(s.date, s.hours) for s in find(Sleep, MRN=MRN)]
  depressions = [(d.date, d.score) for d in find(Depression, MRN=MRN)]

  plot = Plots.plot(sleeps, label="Hours Slept", w=3)
  plot = Plots.plot!(depressions, label="Depression Score", w=3)

  title!(plot, "Patient Records For $(patient.first_name) $(patient.last_name)")
  yaxis!(plot, "Self-Reported Values")

  return plot
end

end

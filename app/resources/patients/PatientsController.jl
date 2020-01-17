module PatientsController

  using Genie.Renderer
  using Main.Patients
  using Main.SleepsController
  using Main.DepressionsController
  using Plots

  """
  struct Patient
    first_name::String
    last_name::String
    DOB::Int
    sex::String
    phone1::Int
    phone2::Int
    email::String
    MRN::Int
  end
  """

  function patient_list()
    pats = [p for p in all(Patients.Patient)]
    "<h1>Patient Info:</h1>
    <ul>$(["<li>$(p.first_name) $(p.last_name) $(p.phone1)</li>" for p in pats]...)</ul>"
  end

  function patient_list_html()
    html(:patients, :patient_list, layout=:app, patients=all(Patient))
  end

  function get_patient_plot_by_MRN(MRN::Int, first_name="", last_name="")
    slp_data = SleepsController.get_sleep_data_by_MRN(MRN)
    dep_data = DepressionsController.get_depression_data_by_MRN(MRN)

    plt = plot(slp_data[1], slp_data[2], label="Hours Slept", w=3)
    plt = plot!(dep_data[1], dep_data[2], label="Depression Score", w=3)

    for p in all(Patients.Patient)
      if p.MRN == MRN
        first_name = p.first_name
        last_name = p.last_name
        break end
    end

    title!(plt, "Patient Records For $first_name $last_name")
    yaxis!(plt, "Self-Reported Values")

    return plt
  end

end

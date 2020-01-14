module PatientsController

  using Genie.Renderer
  using Main.Patients

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

  const TestPatients = Patient[
    Patient("John", "Doe", 12345689, "Male", 5555555555, 5555555555, "john@doe.com", 0000000),
    Patient("Jane", "Doe", 12345689, "Female", 5555555555, 5555555555, "jane@doe.com", 0000000),
  ]

  function patient_list()
    pats = [p for p in all(Patients.Patient)]
    "<h1>Patient Info:</h1>
    <ul>$(["<li>$(p.first_name) $(p.last_name) $(p.phone1)</li>" for p in pats]...)</ul>"
  end

  function patient_list_html()
    html(:patients, :patient_list, layout=:app, patients=all(Patient))
  end
end

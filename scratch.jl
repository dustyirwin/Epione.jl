using Pkg; Pkg.activate(".")
using Genie
using SearchLight

include("./app/resources/patients/Patients.jl")
include("./app/resources/patients/PatientsController.jl")
include("./routes.jl")

SearchLight.Migration.status()
SearchLight.Generator.new_migration("patients")

SearchLight.Migration.down()

haskey(ENV, "HOST") || (ENV["HOST"] = "0.0.0.0")
haskey(ENV, "GENIE_ENV") || (ENV["GENIE_ENV"] = "dev")

SearchLight.Configuration.load_db_connection() |> SearchLight.Database.connect!

startup()


new_p = Patients.Patient(first_name = "Sam", last_name = "Johnson")
SearchLight.save!(new_p)

all(Patients.Patient)
fieldnames(Patients.Patient)

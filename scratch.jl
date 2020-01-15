using Pkg; Pkg.activate(".")
using Genie
using SearchLight
using PyCall
using Plots

#include("genie.jl") BROKEN??

include("./app/resources/patients/Patients.jl")
include("./app/resources/patients/PatientsController.jl")
include("./src/routes.jl")
include("./src/texting.jl")
include("./config/secrets.jl")

haskey(ENV, "HOST") || (ENV["HOST"] = "0.0.0.0")
haskey(ENV, "GENIE_ENV") || (ENV["GENIE_ENV"] = "dev")

SearchLight.Configuration.load_db_connection() |> SearchLight.Database.connect!

startup()


################################################################################


SearchLight.Migration.status()
#SearchLight.Generator.new_migration("patients")
#SearchLight.Generator.newresource("Patient")
#SearchLight.Migration.last_up()

all(Patients.Patient)[1:2]

new_pat = Patients.Patient(first_name="Jane", last_name="Doe", MRN = 0000001)
SearchLight.delete()


PatientsController.patient_list()

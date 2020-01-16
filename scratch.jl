using Pkg; Pkg.activate(".")
using Genie
using SearchLight
using PyCall

#include("genie.jl") BROKEN??

include("./app/resources/patients/Patients.jl")
include("./app/resources/patients/PatientsController.jl")
include("./app/resources/sleeps/Sleeps.jl")
include("./app/resources/sleeps/SleepsController.jl")
include("./config/secrets.jl")
include("./src/routes.jl")
include("./src/texting.jl")

haskey(ENV, "HOST") || (ENV["HOST"] = "0.0.0.0")
haskey(ENV, "GENIE_ENV") || (ENV["GENIE_ENV"] = "dev")

SearchLight.Configuration.load_db_connection() |> SearchLight.Database.connect!

startup()


################################################################################


SearchLight.Migration.status()
#SearchLight.Generator.new_migration("patients")
#SearchLight.Generator.newresource("Patient")
#SearchLight.Migration.last_up()

new_pat = Patients.Patient(first_name="Jane", last_name="Doe", MRN = 0000001)
new_sleep = Sleeps.Sleep(MRN=2, date=string(now()), hours=7.5)
save!(new_sleep)

all(Sleeps.Sleep)



sleep_plot = plot(, rand(length(dates)))
title!(sleep_plot, "Patient Sleep Record For $first_name $last_name")
yaxis!(sleep_plot, "Reported Hours Slept")


SleepsController.plot_sleep_hours_by_MRN(2)
p = get_patient_data_by_MRN(2)
p.first_name


string(now())

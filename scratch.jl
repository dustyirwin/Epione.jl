using Pkg; Pkg.activate(".")
using Genie
using SearchLight
using PyCall
using Dates: now, Second
using Plots

#include("genie.jl") BROKEN??

include("./app/resources/sleeps/Sleeps.jl")
include("./app/resources/sleeps/SleepsController.jl")
include("./app/resources/depressions/Depressions.jl")
include("./app/resources/depressions/DepressionsController.jl")
include("./app/resources/patients/Patients.jl")
include("./app/resources/patients/PatientsController.jl")
include("./config/secrets.jl")
include("./src/routes.jl")
include("./src/texting.jl")

haskey(ENV, "HOST") || (ENV["HOST"] = "0.0.0.0")
haskey(ENV, "GENIE_ENV") || (ENV["GENIE_ENV"] = "dev")

SearchLight.Configuration.load_db_connection() |> SearchLight.Database.connect!

startup()

################################################################################

SearchLight.Migration.status()

Patients.Patient(first_name="Oprah", last_name="Winfrey", MRN = 5) |> save!

timestamp = ceil(now(), Second(1))
Sleeps.Sleep(MRN=2, date=string(timestamp), hours=7.5) |> save!
Depressions.Depression(MRN=2, date=string(timestamp), score=4.0) |> save!

all(Patients.Patient)
all(Sleeps.Sleep)
all(Depressions.Depression)

dep_data = DepressionsController.get_depression_data_by_MRN(2)
slp_data = SleepsController.get_sleep_data_by_MRN(2)

q = PatientsController.get_patient_plot_by_MRN(2)
savefig(q, "./app/plots/1234.png")
p = get_patient_data_by_MRN(2)
p.first_name

d = string(now())[1:10]

MRN = 2
p = PatientsController.get_patient_plot_by_MRN(MRN)
savefig(p, "./app/plots/$(MRN).png")

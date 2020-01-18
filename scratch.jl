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
include("./src/messages.jl")
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
Sleeps.Sleep(MRN=3, date=string(timestamp), hours=8.5) |> save!
Depressions.Depression(MRN=3, date=string(timestamp), score=5.5) |> save!

all(Patients.Patient)
all(Sleeps.Sleep)
all(Depressions.Depression)

dep_data = DepressionsController.get_depression_data_by_MRN(2)
slp_data = SleepsController.get_sleep_data_by_MRN(2)

q = PatientsController.get_patient_plot_by_MRN(3)
savefig(q, "./public/plots/1.png")

pats = 20
time_to_process_manually_in_mins = 5
labor_cost_per_min = 35/60
outreach_days_per_month = 30.5
cost_savings = pats *
  time_to_process_manually_in_mins *
  labor_cost_per_min *
  outreach_days_per_month

labor_cost_savings_per_month_per_pat = cost_savings / pats

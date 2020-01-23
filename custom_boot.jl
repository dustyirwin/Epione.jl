using Pkg; Pkg.activate(".")
using Genie
using SearchLight
using PyCall
using Dates: now, Second
using Plots
using OnlineStats

#include("genie.jl") BROKEN??

include("./app/resources/sleeps/Sleeps.jl")
include("./app/resources/depressions/Depressions.jl")
include("./app/resources/patients/Patients.jl")
include("./app/resources/patients/PatientsController.jl")
include("./config/secrets.jl")
include("./src/messages.jl")
include("./src/routes.jl")
include("./src/texting.jl")

haskey(ENV, "HOST") || (ENV["HOST"] = "0.0.0.0")
haskey(ENV, "GENIE_ENV") || (ENV["GENIE_ENV"] = "dev")

SearchLight.Configuration.load_db_connection() |> SearchLight.Database.connect!

Genie.startup()

################################################################################

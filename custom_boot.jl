using Pkg; Pkg.activate(".")

using Genie
using SearchLight

ENV["PYTHON"] = "C:\\Users\\dustin.irwin\\AppData\\Local\\Programs\\Python\\Python37\\python.exe"
haskey(ENV, "HOST") || (ENV["HOST"] = "0.0.0.0")
haskey(ENV, "GENIE_ENV") || (ENV["GENIE_ENV"] = "dev")

include("./app/resources/sleeps/Sleeps.jl")
include("./app/resources/depressions/Depressions.jl")
include("./app/resources/patients/Patients.jl")
include("./app/resources/patients/PatientsController.jl")
include("./config/Secrets.jl")
include("./src/Texting.jl")
include("./src/messages.jl")
include("./src/routes.jl")

SearchLight.Configuration.load_db_connection() |> SearchLight.Database.connect!
Genie.startup()

################################################################################

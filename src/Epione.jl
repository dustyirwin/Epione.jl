module Epione

using Logging, LoggingExtras

function main()
  Base.eval(Main, :(const UserApp = Epione))

  include(joinpath("..", "genie.jl"))

  Base.eval(Main, :(const Genie = Epione.Genie))
  Base.eval(Main, :(using Genie))
end; main()

end

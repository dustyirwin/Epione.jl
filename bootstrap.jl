  cd(@__DIR__)
  import Pkg
  Pkg.pkg"activate ."

  function main()
    include(joinpath("src", "Epione.jl"))
  end; main()

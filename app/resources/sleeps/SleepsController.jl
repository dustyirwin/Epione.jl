module SleepsController

  using Main.Sleeps

  """
  struct Sleep
    MRN::Int
    date::String
    hours::Float64
  end
  """

  function get_sleep_data_by_MRN(MRN::Int, hours=Float64[], dates=String[])
    for s in all(Sleeps.Sleep)
      if MRN == s.MRN
        append!(dates, [s.date])
        append!(hours, [s.hours]) end end
    return dates, hours
  end

end

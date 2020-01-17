module DepressionsController

  using Main.Depressions

  """
  struct Sleep
    MRN::Int
    date::String
    score::Float64
  end
  """

  function get_depression_data_by_MRN(MRN::Int, scores=Float64[], dates=String[])
    for s in all(Depressions.Depression)
      if MRN == s.MRN
        append!(dates, [s.date])
        append!(scores, [s.score]) end end
    return dates, scores
  end

end

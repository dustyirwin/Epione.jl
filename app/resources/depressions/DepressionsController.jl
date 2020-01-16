module DepressionsController

    using Main.Depressions
    using Plots

    struct Sleep
        MRN::Int
        date::String
        score::Float64
    end

    function plot_sleep_hours_by_MRN(MRN, scores=[], dates=[])
        for s in all(Depressions.Depression)
            if MRN == s.MRN
                append!(dates, s.date)
                append!(scores, s.score) end end
        @show plot(dates, scores)
    end
end

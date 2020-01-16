module SleepsController

    using Main.Sleeps
    using Plots

    struct Sleep
        MRN::Int
        date::String
        hours::Float64
    end

    function plot_sleep_hours_by_MRN(MRN, hours=[], dates=[])
        for s in all(Sleeps.Sleep)
            if MRN == s.MRN
                append!(dates, s.date)
                append!(hours, s.hours) end end
        @show plot(dates, hours)
    end
end

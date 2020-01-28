sleep_stats = Series(Mean(), Variance(), Extrema())
fit!(sleep_stats, (6.1,7.5,8.5))

sleep_stats.stats

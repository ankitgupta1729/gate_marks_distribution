library(fpp3)
marks<-readr:: read_csv("datasets/all_years_total_marks.csv")
marks |> as_tsibble(index = Year) -> marks

# time plots

marks |> autoplot(`Theory of Computation`)+labs(y='Theory Of Computation',title = 'Marks vs Year')
marks |> ggplot(aes(x=Year,y=`Theory of Computation`))+geom_point()
marks |> ggplot(aes(x=Year,y=`Theory of Computation`))+geom_line()
marks |> autoplot(`Theory of Computation`)+geom_point()
marks |> gg_season(`Theory of Computation`)+labs(y='Marks',title = 'Marks vs Years')
marks |> gg_subseries(`Theory of Computation`)+labs(y='Marks',title = 'Marks vs Years')

marks |> GGally:: ggpairs(columns = 2:9)

marks |> gg_lag(`Theory of Computation`,geom='point')

marks|>ACF(Algorithms,lag_max = 9)

marks|>ACF(`Linear Algebra`,lag_max = 9)


marks|>ACF(`Set Theory & Algebra`,lag_max = 9)

marks|>ACF(Algorithms,lag_max = 9) |> autoplot()
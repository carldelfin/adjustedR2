# adjustedR2

I figured it would be fun to make a [Shiny](https://shiny.rstudio.com/) app that plots different analytical adjustments to the [coefficient of determination](https://en.wikipedia.org/wiki/Coefficient_of_determination), **R^2**, at different effect sizes, sample sizes, and number of predictors.

There's some discussion on this topic over at stats.stackexchange.com, see e.g. [here](https://stats.stackexchange.com/questions/25214/how-to-choose-between-the-different-adjusted-r2-formulas), [here](https://stats.stackexchange.com/questions/55929/what-is-an-unbiased-estimate-of-population-r-square) and [here](https://stats.stackexchange.com/questions/63389/does-adjusted-r-square-seek-to-estimate-fixed-score-or-random-score-population-r).

I used formulas from Walker, D.A., 2007, A Comparison of Eight Shrinkage Formulas under Extreme Conditions, *Journal of Modern Applied Statistical Methods*. The article may be found [here](http://digitalcommons.wayne.edu/cgi/viewcontent.cgi?article=1133&context=jmasm).

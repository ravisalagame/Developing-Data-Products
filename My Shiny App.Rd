\name{My Shiny App - Plotting Selected mtcars data with a regression line}
\alias{Developing Data Products}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
 This project is a simple illustration of Shiny App. It reads mtcars data and plots mpg v/s another variable for each cylinder type you choose. It also fits a linear regression line and plots it on the plot
}
\details{

When you run the application, you will see two inputs on the left side
1. No. of Cylinders and 2. Plot mpg v/s ? 
Choose both options.
Once you choose, you will see a plot of mpg V/s variable you have chosen for the number of cylinders you have chosen - 4, 6 or 8. The plot is automatically updated as you make your choice.
Along with the plot, the R script calculates regression line and plots it over th current plot for each of the variable set. Mean is calculated for each set of data for given number of cylinders. Mean table is also displayed at the end
}

\note{

Note : The app is hosted on RStudio Shiny server. Depending on network speed, it might be a little slow to update the plot

}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

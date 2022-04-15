##Week 4 
##Mariana MacDonald
##4/10/22
## Assignment 2

##We interact with a few datasets in this course, one you are already familiar with, the 2014 American
##Community Survey and the second is a Housing dataset, that provides real estate transactions recorded 
##from 1964 to 2016.  For this exercise, you need to start practicing some data transformation steps –
##which will carry into next week, as you learn some additional methods.  For this week, using either 
##dataset (or one of your own – although I will let you know ahead of time that the Housing dataset
##is used for a later assignment, so not a bad idea for you to get more comfortable with now!), 
##perform the following data transformations:

library(readxl)
real.estate <- read_excel("week-7-housing.xlsx")


## a - Use the apply function on a variable in your dataset

salesPrice_sum <- apply(real.estate['Sale Price'], 2, sum)
salesPrice_sum

## b - Use the aggregate function on a variable in your dataset

# agg_max = aggregate(real.estate$`Sale Price`, by = list(real.estate$zip5), FUN=max, na.rm=TRUE)
# agg_max

agg_max <- aggregate('Sale Price' ~ zip5, real.estate, max)
agg_max

## c - Use the plyr function on a variable in your dataset – more specifically, I want to see you split 
##some data, perform a modification to the data, and then bring it back together

library(plyr)
library(dplyr)
##ddply(real.estate, .variable = "bedrooms", summarise, mean_bedrooms = mean(bedrooms))

##ddply(real.estate, .variables = "bedrooms", .fun = colwise(mean))

{ x <- ddply(real.estate, c("zip5"), summarize, max=max(bedrooms) )
  print(x)  }



## d - Check distributions of the data

# distribution = hist(real.estate$`Sale Price`)

salesPrice_hist <- ggplot(real.estate) + geom_histogram(aes(Sale_Price)) +
  scale_x_continuous(labels = scales::comma) +
  labs(x = "Sales Price", y = "Count")
salesPrice_hist

## e - Identify if there are any outliers

##No outliers for bedrooms


## f - Create at least 2 new variables

real.estate['price.per.sqfeet'] <- real.estate$`Sale Price`/real.estate$square_feet_total_living
real.estate['price.per.sqfeet']


real.estate['total_bath_count'] <- (real.estate$bath_full_count + real.estate$bath_half_count + real.estate$bath_3qtr_count)
real.estate['total_bath_count']



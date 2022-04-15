#Assignment Week5
#Name: Mariana MacDonald
#Date: 4/17/22

# 1 - Using either the same dataset(s) you used in the previous weeks’ exercise or a brand-new 
#dataset of your choosing, perform the following transformations (Remember, anything you learn 
#about the Housing dataset in these two weeks can be used for a later exercise!)

# a) Using the dplyr package, use the 6 different operations to analyze/transform the data - GroupBy, 
#Summarize, Mutate, Filter, Select, and Arrange – Remember this isn’t just modifying data, 
#you are learning about your data also – so play around and start to understand your dataset in 
#more detail

library(readxl)
real.estate <- read_excel("week-7-housing.xlsx")

library(plyr)
library(dplyr)
library(magrittr)

select(real.estate, "Sale.Price", "zip5")
real.estate %>% select(Sale.Price, zip5)

filter(real.estate, ctyname == "REDMOND")
real.estate %>% filter(ctyname == "REDMOND")

real.estate %>% select(Sale.Price, square_feet_total_living) %>%
  mutate(Sale.Price/square_feet_total_living)

real.estate %>%
  group_by(square_feet_total_living) %>%
  summarize(AvgPrice=mean(Sale.Price))

summarize(real.estate,mean(Sale.Price))

real.estate %>%
  group_by(square_feet_total_living) %>%
  summarize(AvgPrice=mean(Sale.Price), SumBath=sum(bath_full_count+bath_half_count+bath_3qtr_count)) %>%
  arrange(desc(AvgPrice))

# b) Using the purrr package – perform 2 functions on your dataset.  You could use zip_n, keep, 
#discard, compact, etc.

library(purrr)
library(dplyr)


real.estate %>% select(Sale.Price) %>% map_dbl(mean)

real.estate %>% select(Sale.Price, square_feet_total_living) %>%
  keep(function(x) mean(x) < 10000)

real.estate$Sale.Price %>% every(is.numeric)


# c) Use the cbind and rbind function on your dataset
#cbind() combines vectors as columns, while rbind() combines them as rows.

pricePerSqft <- cbind(saleprice = real.estate$Sale.Price, sqft = real.estate$square_feet_total_living)
head(pricePerSqft)

#rbind to add head and tail together
df1 <- head(real.estate)
df2 <- tail(real.estate)

cat("First Data Frame: ", "\n")
df1
cat("Second Data Frame: ", "\n")
df2

combinedDf <- rbind(df1, df2)
cat("Combined by rows: ", "\n")
combinedDf


#    rbind to add new data to the end of the excel document

newData <- c(100000, 5321)
newData
pricePerSqft_new = rbind(pricePerSqft, newData)
tail(pricePerSqft_new)


# d) Split a string, then concatenate the results back together

library(stringr)

real_estate_new <- real.estate %>%
  separate(Sale.Date, sep="-", into = c("Year", "Month", "Day"))
head(real_estate_new)

# Concatenate date to format mm-dd-yyyy
real_estate_new['JoinedDate'] <- str_c(real_estate_new$Month, '-', real_estate_new$Day, 
                                   '-', real_estate_new$Year)
conc_realestate <- real_estate_new %>% 
  select(Month, Day, Year, JoinedDate)
conc_realestate


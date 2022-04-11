##Week 4 
##Mariana MacDonald
##4/10/22
## Assignment 1


##Test Scores
##A professor has recently taught two sections of the same course with only one difference between 
##the sections. In one section, he used only examples taken from sports applications, 
##and in the other section, he used examples taken from a variety of application areas. 
##The sports themed section was advertised as such; so students knew which type of 
##section they were enrolling in. The professor has asked you to compare student performance
##in the two sections using course grades and total points earned in the course. 
##You will need to import the Scores.csv dataset that has been provided for you.

##Use the appropriate R functions to answer the following questions:
## 1 - What are the observational units in this study?

##the students

## 2- Identify the variables mentioned in the narrative paragraph and determine which are categorical
##and quantitative?

##Categorical: Section
##Quantitative: Count and Score

print(class(scores$Count))
print(class(scores$Score))
print(class(scores$Section))

## 3 - Create one variable to hold a subset of your data set that contains only the Regular Section 
##and one variable for the Sports Section.

scores <- read.csv("scores.csv")

regular_section = subset(scores, Section == "Regular")
head(regular_section)

sports_section = subset(scores, Section == "Sports")
head(sports_section)

## 4 - Use the Plot function to plot each Sections scores and the number of students achieving that score. 
##Use additional Plot Arguments to label the graph and give each axis an appropriate label.
##Once you have produced your Plots answer the following questions:

reg_hist = hist(regular_section$Score)
sport_hist = hist(sports_section$Score)

plot(reg_hist, col = rgb(0, 1, 0, 0.5), xlab = "Score", ylab = "# Students")
plot(sport_hist, col = rgb(1, 0, 0, 0.5), add = TRUE)


# PINK = Sports
# Brown = Regular


## a- Comparing and contrasting the point distributions between the two section, looking at both tendency
##and consistency: Can you say that one section tended to score more points than the other? 
##Justify and explain your answer.

summary(regular_section)
summary(sports_section)

##except for the max that is highers in Sports, the mean, median, 1st qua, 3rd quart are all higher in 
##regular than sports


## b - Did every student in one section score more points than every student in the other section? 
##If not, explain what a statistical tendency means in this context.

##No. Even though the mean, median are higher at the regular, the max is higher at sports, meaning at least one
##person scored more there than at regular.

## c- What could be one additional variable that was not mentioned in the narrative that could be 
##influencing the point distributions between the two sections?

##number of students

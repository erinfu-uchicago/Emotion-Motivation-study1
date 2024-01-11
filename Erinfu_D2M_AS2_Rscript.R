options(repos=c(CRAN="https://cran.rstudio.com"))

## loads tidyverse and papaja
library(papaja)
library(tidyverse)

## require one more package
# devtools (prerequired for Ime4)
install.packages("devtools")
# lme4
library("devtools"); install_github("lme4/lme4",dependencies=TRUE)
library(lme4)
# psych
library("psych") 

## assign numberic variable
numberic_variable_1 = 10
numberic_variable_2 = 3.14159
numberic_variable_3 = -1.234

## assign string/character variable
string_character_variable_1 = "Hello world"
string_character_variable_2 = "I am assigning a string variable!"
string_character_variable_3 = "It can be also called a character variable."

## Create a dataframe
emotion = c("enjoyment", "surprise", "fear")
age = c(4, 5, 6)
motivation = c("high", "low", "medium")
EM_dataframe = data.frame(Emotion = emotion, Age = age, Motivation = motivation)
print(EM_dataframe)


## Data Preparation

# Since I already have a dataset that is tidy enough, 
# the first task for me before I start my formal data analysis will be to gain enough responses from participants.

# After that, there are several steps I have to follow:
# 1. Data import
# 2. Separate the column (separate the value and text for each sub-measurement)
# 3. Build a linear mixed effects model based on my data, using emotion to predict children’s ratings in the four sub-measurements of motivation
# 4. Export results with tables and plots

# Now, I am quite confident in finishing the first two steps, 
# but I don't have a clear idea about how to finish the last two steps with R.

## Step 1
library(tidyverse)
EM_formal_dataset <- read.csv("data/ErinFu_Dataset_E&M_1114-1206_edit.csv")

## Step 2
separate_wider_delim(Surprise.Interesting,
                     delim = ". ",
                     names = c("Surprise.Interesting.Score", "Surprise.Interesting.Note"))

## Step 3 & 4 -> ?


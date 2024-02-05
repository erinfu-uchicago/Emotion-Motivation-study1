# Emotion-Motivation-study1
This is the repo for study1 of Emotion and motivation paper. This is also the repo that used for R course temperately (now: AS1.1).

## AS1.2

I already installed tidyverse and papaja

I already created an R script file

I already created an R Notebook with the Papaja template

**Update after the class**

I edited and renamed the R script file to see if could solve the knitting problem I faced when using the papaja template for knitting. The problem wasn't fixed, and I still cannot knit the Rmd file if it contains a "source" code. (keep updating)

I added one "option" code at the beginning of R script file to solve the knitting problem. The problem fixed. (end)

## AS3

**Part 1**

*Brief Description of Data*

This dataset is expected to consist of 100 responses from participants, which include their gender, age, parents’ educational level, and family income as demographic information. This dataset is used to explore how children's motivation to learn a specific subject will be affected by adults' emotional expression. Learning motivation was measured from four sub-measurements: how much the child thinks that subject is 1) interesting, 2)important, 3) difficult, and 4) they want to learn it. Each sub-measurement was measured with a 6-point scale. There are six emotions included in this study: Surprise, Awe, Enjoyment, Neutral, Fear, and Sadness.

*Brief Overview of Planned Project*

This study adopted a within-subject design. Data were collected to reflect how children’s learning motivation levels varied by receiving the influence of different adults’ emotional expressions towards a specific subject. The results will mainly focus on exploring the effect of other’s positive emotions on children’s learning motivation, and compare it with that of neutral or negative emotions. A linear mixed effects model will be conducted for data analysis.

*Hypothetical File Tree*
```{file tree}
--[top level]
  --.gitignore
  --README.md
  --Analysis_maincode.R (include the main code for data analysis)
  --Analysis_report.Rmd (knit the final report with the APA template)
--data
  --ErinFu_Emotion&Motivation_rawdata.csv (raw statistic data)
  --ErinFu_Emotion&Motivation_cleareddata.csv (edited statistic data)
--scripts
  --Data_preprocessing.R (R script for data preprocessing)
  --Data_analysis.R (R script for formal data analysis)
  --Data_visualization.R (R script for creating plots and images)
--results
  --plots
    --Plot_interesting.png (the plot of "interest sub-measurement)
    --Plot_important.png (the plot of "important sub-measurement)
    --Plot_difficult.png (the plot of "difficult" sub-measurement)
    --Plot_motivation.png (the plot of "motivation" sub-measurement)
  --tables
    --Table_regression.csv (the table of regression result)
    --Table_correlation.csv (the table of correlation result)
```

**Part 2**

Edited the .gitignore includes three types of files and added a comment for each

## AS4  

Created a new R script file and created a hello_world() function

## AS5

**Update the YAML header**  
**Call the hello_world() function**  
source() the R script where I defined the hello_world() function in the first chunk
created a new chunk below and called the hello_world() function  
**Edited markdown**  
edited markdown (mainly in Methods part) to meet the requirement

## AS6  

**Read-in and "tidy"**  
Created and named a new chunk and use readr to read-in the temporary dataset  
Examined if it is tidy in RStudio (Yes!)  
**Intermediate dataset**  
Created and named a new chunk  
Used 2+ dplyr functions to create an intermediate dataset and used readr to write it to a .csv  
Examined the new intermediate data file in Excel. (Looks good!)  

## AS7  

**Mockup a preliminary dataset**  
Created a new dataset file in data  
**Create a new .R script**  
Created an .R script called data-prep.R and used comments to write out the data analysis plan  

## AS8  

**Recreate the modified starwars dataset**  
Followed the instructions in the file and manipulated the built-in starwars tibble to create a new object  

**Update after the class**
I fixed the problem of arrangement! (end)

## AS9

**Finish prepping your data**  
Finished the data preparation by making the dataset become a long and tidy format  

## AS10

**Mock up 2 plots**  
Mocked up 2 plots in 2 different chunks in my .Rmd file by using ggplot code

## AS11

**Part 1**  
Recreated three plots in starwars.R  
**Part 2**  
Added one more plot to my .Rmd  

## AS12

**Part 1**  
Recreated three more plots (intermediate) in starwars.R  
**Part 2**  
Tuned up my plot and add another to my .Rmd  



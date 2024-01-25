library(tidyverse)

## Create your goal tibble to replicate

# Run this line to see what your end product should look like
sw.wrangled.goal <- read_csv("data/sw-wrangled.csv") %>% 
  mutate(across(c(hair, gender, species, homeworld), factor)) # this is a quick-and-dirty fix to account for odd importing behavior

# View in console
sw.wrangled.goal 

# Examine the structure of the df and take note of data types
# Look closely at factors (you may need another function to do so) to see their levels
str(sw.wrangled.goal) 



## Use the built-in starwars dataset to replicate the tibble above in a tbl called sw.wrangled
# If you get stuck, use comments to "hold space" for where you know code needs to go to achieve a goal you're not sure how to execute
sw.wrangled <- starwars %>%
  
  # select all the column that we needed: name, hight, mass, hair_color, gender, species, homeworld
  select(name, height, mass, hair_color, gender, species, homeworld) %>%
  # These are all the chenges that should be done:
  # separate the first name and last name; create a column called initials
  separate(name, c("first_name", "last_name"),
           sep = " ",
           fill = "right") %>%
  mutate(initials = paste0(substr(first_name, 1, 1), substr(last_name, 1, 1))) %>%
  # create height_in and height_cm based on height
  filter(!is.na(height)) %>%  
  rename(height_cm = height) %>%
  mutate(height_in = height_cm / 2.54) %>%
  # call hair_color hair and creat brown_hair based on that
  rename(hair = hair_color) %>%
  mutate(hair = ifelse(is.na(hair), "bald", hair)) %>%
  mutate(brown_hair = (hair == "brown")) %>%
  # change the value of gender with only initial letter
  mutate(gender = substr(gender, 1, 1)) %>%
  # capital all the letters in species
  mutate(species = toupper(species))

# disordered
desired_order <- c("first_name", "last_name", "initials", "height_in", "height_cm", "mass", "hair", "gender", "species", "homeworld", "brown_hair") 
sw.wrangled <- sw.wrangled %>%
  select(all_of(desired_order)) %>%
  arrange(last_name, first_name)

write_csv(sw.wranged, "data/starwar_edited.csv")

## Check that your sw.wrangled df is identical to the goal df
# Use any returned information about mismatches to adjust your code as needed
all.equal(sw.wrangled.goal, sw.wrangled.goal)

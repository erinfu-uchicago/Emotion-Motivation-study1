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

### AS11 Part1  
## Plot 1  
ggplot(sw.wrangled, aes(height_cm)) + geom_histogram(binwidth = 10) +
  coord_cartesian(ylim = c(0,21)) +
  scale_y_continuous(breaks = seq(0, 20, by = 5))

## Plot 2
sw.wrangled %>%
  ggplot(aes(x = fct_infreq(hair))) +
  geom_bar() +
  labs(x = "sorted_hair")

## Plot 3
ggplot(sw.wrangled, aes(x = height_in, y = mass)) + 
  geom_point(shape = 17) +
  coord_cartesian(ylim = c(13,160), xlim = c(25,93)) +
  scale_y_continuous(breaks = seq(40, 160, by = 40)) +
  scale_x_continuous(breaks = seq(40, 80, by = 20))

### AS12 Part1
## Plot 1
sw.wrangled %>%
  filter(!is.na(mass)) %>%
  ggplot(aes(x = fct_infreq(hair), y = mass, fill = fct_infreq(hair))) +
  geom_boxplot() +
  geom_point() +
  scale_y_continuous(limits = c(10, 160)) +
  labs(x = "Hair color(s)", y = "Mass (kg)", fill = "Colorful hair")

## Plot 2
sw.wrangled %>%
  filter(!is.na(mass)) %>%
  mutate(brown_hair = factor(brown_hair, levels = c("TRUE", "FALSE"), labels = c("Has brown hair", "No brown hair"))) %>%
  group_by(brown_hair) %>%
  ggplot(aes(x = mass, y = height_in)) +
  geom_smooth(method = "lm") +
  geom_point() +
  facet_grid(.~brown_hair) +
  coord_cartesian(ylim = c(-10,200)) +
  scale_x_continuous(limits = c(-200, 200)) +
  scale_y_continuous(breaks=c(-4, 20, 23, 80, 100)) +
  labs(title = "Mass vs. by brown-hair-havingness", subtitle = "A critically important analysis")

## Plot 3
sw.wrangled %>%
  filter(!is.na(species)) %>%
  mutate(species_first_letter = paste0(str_sub(species, 1, 1))) %>% 
  group_by(gender) %>%
  ggplot(aes(y = factor(species_first_letter, levels = rev(levels(factor(species_first_letter)))), fill = gender)) +
  geom_bar() +
  labs(y = "species_first_letter", caption = "A clear male human bias")

## AS13 Part1
# Plot 1
sw.wrangled$gender <- factor(sw.wrangled$gender)
sw.wrangled$gender <- relevel(sw.wrangled$gender, ref = "f")
levels(sw.wrangled$gender) <- c("Female", "Male")
sw.wrangled$gender <- factor(sw.wrangled$gender, levels = c("Female", "Male", "Other"))
sw.wrangled$gender[is.na(sw.wrangled$gender)] <- "Other"

sw.wrangled %>%
  filter(!is.na(mass)) %>%
  group_by(gender) %>%
  ggplot(aes(x = height_cm, y = mass)) +
  geom_smooth(method = "lm", aes(color = gender), fill = "#CCCCFF") +
  scale_color_manual(values = c("Female" = "#8E1D20", "Male" = "#AFAAB4", "Other" = "#FAAE44")) +
  geom_point(aes(color = gender), alpha = .5) +
  facet_wrap(.~gender, scales = "free_y") +
  coord_cartesian(xlim = c(60,270)) +
  scale_x_continuous(breaks = seq(60, 270, by = 30)) +
  labs(title = "Height and weight across gender presentation", subtitle = 'A cautionary tale in misleading "free" axis scales & bad design choices ', x = "Height (cm)", y = "Mass (kg)", color = "Gender Presentation", caption = "Color hint: use the ggsci package!") +
  theme(
    panel.border = element_rect(colour = "black", fill = NA, size = 0.1),
    panel.background = element_rect(fill = "#FFEEEE"),
    strip.background = element_rect(fill = "#006400"),
    strip.text = element_text(colour = "white", hjust = 0, family = "Courier New"),
    panel.grid.major.y = element_line(colour = "#DFDADA", linetype = 4, size = 1),  
    panel.grid.minor.y = element_blank(),
    axis.text.y = element_text(hjust = 0, family = "Bookman Old Style", face = "bold.italic"),
    panel.grid.major.x = element_line(linetype = 2, size = 0.6),
    panel.grid.minor.x = element_blank(),
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "bottom",
    legend.background = element_rect(fill = "#CCCCFF"),
    plot.caption = element_text(color = "red", angle = 180, hjust = 0),
    text = element_text(family = "Comic Sans MS"),
    legend.title = element_text(family = "Brush Script MT", size = 18)
  )

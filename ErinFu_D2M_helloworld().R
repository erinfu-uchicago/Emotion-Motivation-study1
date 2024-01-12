# Object assignment 
name <- c("Anna", "Ben", "Cindy", "Danny", "Erin", "Frank")

hello_world <- function(name) {
  # Challenge: for loop
  for (n in name) {
    # Conditional statement
    if (n == "Anna" || n == "Cindy" || n == "Erin") {
      message("Hi! My name is ", n, ". I'm a girl!")
    } else {
      message("Hi! My name is ", n, ". I'm a boy!")
    }
  }
}

class_group <- c("Anna", "Ben", "Erin")
hello_world(class_group)

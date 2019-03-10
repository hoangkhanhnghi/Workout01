Title: Data Preparation
Description: Codes for Data Preparation
Inputs: Five csv. files
Outputs: The summaries of the above csv.files and a general summary of all those files.


library(dplyr)

iguodala <- read.csv("../Desktop/workout01/data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../Desktop/workout01/data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../Desktop/workout01/data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../Desktop/workout01/data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../Desktop/workout01/data/stephen-curry.csv", stringsAsFactors = FALSE)

name <- c("Andre Iguodala")
iguodala <- data.frame(name,iguodala)
name <- c("Draymond Green")
green <- data.frame(name,green)
name <- c("Kevin Durant")
durant <- data.frame(name,durant)
name <- c("Klay Thompson")
thompson <- data.frame(name,thompson)
name <- c("Stephen Curry")
curry <- data.frame(name,curry)

iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] <- c("shot_no")
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] <- c("shot_yes")

green$shot_made_flag[green$shot_made_flag == "n"] <-c("shot_no")
green$shot_made_flag[green$shot_made_flag == "y"] <- c("shot_yes")
durant$shot_made_flag[durant$shot_made_flag == "n"] <- c("shot_no")
durant$shot_made_flag[durant$shot_made_flag == "y"] <- c("shot_yes")
thompson$shot_made_flag[thompson$shot_made_flag == "n"] <- c("shot_no")
thompson$shot_made_flag[thompson$shot_made_flag == "y"] <- c("shot_yes")
curry$shot_made_flag[curry$shot_made_flag == "n"] <- c("shot_no")
curry$shot_made_flag[curry$shot_made_flag == "y"] <- c("shot_yes")

iguodala <- mutate(iguodala, minute = period*12-minutes_remaining)
green <- mutate(green, minute = period*12-minutes_remaining)
durant <- mutate(durant, minute = period*12-minutes_remaining)
thompson <- mutate(thompson, minute = period*12-minutes_remaining)
curry <- mutate(curry, minute = period*12-minutes_remaining)

sink(file="../Desktop/workout01/output/andre-iguodala-summary.txt")
summary(iguodala)
sink(file="../Desktop/workout01/output/draymond-green-summary.txt")
summary(green)
sink(file="../Desktop/workout01/output/kevin-durant-summary.txt")
summary(durant)
sink(file="../Desktop/workout01/output/klay-thompson-summary.txt")
summary(thompson)
sink(file="../Desktop/workout01/output/stephen-curry-summary.txt")
summary(curry)

write.csv(
  x=iguodala,
  file="../Desktop/workout01/data/andre-iguodala.csv"
)
write.csv(
  x=green,
  file="../Desktop/workout01/data/draymond-green.csv"
)
write.csv(
  x=durant,
  file="../Desktop/workout01/data/kevin-durant.csv"
)
write.csv(
  x=thompson,
  file="../Desktop/workout01/data/klay-thompson.csv"
)
write.csv(
  x=curry,
  file="../Desktop/workout01/data/stephen-curry.csv"
)
df <- rbind(iguodala,green,durant,thompson,curry)
write.csv(
  x=df,
  file="../Desktop/workout01/data/shots-data.csv")

sink(file="../Desktop/workout01/output/shots-data-summary.txt")
summary(df)
Title: Shot Charts
Description: Codes for plotting charts
Inputs: Five csv. files
Outputs: The dpf plots of above csv. data


install.packages("jpeg")

library(ggplot2)
require(dplyr)
library(grid)
library(jpeg)

iguodala <- read.csv("../Desktop/workout01/data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../Desktop/workout01/data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../Desktop/workout01/data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../Desktop/workout01/data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../Desktop/workout01/data/stephen-curry.csv", stringsAsFactors = FALSE)
shots_data <- read.csv("../Desktop/workout01/data/shots-data.csv", stringsAsFactors = FALSE)

court_file <- "../Desktop/workout01/images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file),
  width=unit(1, "npc"),
  height=unit(1, "npc")
)

pdf(file="../Desktop/workout01/images/andre-iguodala-shot-chart.pdf",width=6.5,height=5)
ggplot(data=iguodala) +
  annotation_custom(court_image,-250,250,-50,420) +
  geom_point(aes(x=x,y=y,color=shot_made_flag)) +
  ylim(-50,420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
dev.off()

pdf(file="../Desktop/workout01/images/draymond-green-shot-chart.pdf",width=6.5,height=5)
ggplot(data=green) +
  annotation_custom(court_image,-250,250,-50,420) +
  geom_point(aes(x=x,y=y,color=shot_made_flag)) +
  ylim(-50,420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
dev.off()

pdf(file="../Desktop/workout01/images/kevin-durant-shot-chart.pdf",width=6.5,height=5)
ggplot(data=durant) +
  annotation_custom(court_image,-250,250,-50,420) +
  geom_point(aes(x=x,y=y,color=shot_made_flag)) +
  ylim(-50,420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
dev.off()

pdf(file="../Desktop/workout01/images/klay-thompson-shot-chart.pdf",width=6.5,height=5)
ggplot(data=thompson) +
  annotation_custom(court_image,-250,250,-50,420) +
  geom_point(aes(x=x,y=y,color=shot_made_flag)) +
  ylim(-50,420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
dev.off()

pdf(file="../Desktop/workout01/images/stephen-curry-shot-chart.pdf",width=6.5,height=5)
ggplot(data=curry) +
  annotation_custom(court_image,-250,250,-50,420) +
  geom_point(aes(x=x,y=y,color=shot_made_flag)) +
  ylim(-50,420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
dev.off()

pdf(file="../Desktop/workout01/images/gsw-shot-chart.pdf",width=8,height=7)
ggplot(data=shots_data) +
  annotation_custom(court_image,-250,250,-50,420) +
  geom_point(aes(x=x,y=y,color=shot_made_flag)) +
  ylim(-50,420) +
  ggtitle('Shot Chart: GSW (2016 season)') +
  theme_minimal() +
  facet_wrap(~name)
dev.off()

png(filename="../Desktop/workout01/images/gsw-shot-chart.png",width=8*96,height=7*96)
ggplot(data=shots_data) +
  annotation_custom(court_image,-250,250,-50,420) +
  geom_point(aes(x=x,y=y,color=shot_made_flag)) +
  ylim(-50,420) +
  ggtitle('Shot Chart: GSW (2016 season)') +
  theme_minimal() +
  facet_wrap(~name)
dev.off()
```
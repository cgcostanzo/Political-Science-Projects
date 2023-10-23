setwd("/Users/charlescostanzo/College/Au 2022/Politsc 4132H/Prediction paper poll data/")

library(ggplot2)
library(tidyverse)
library(dplyr)
library(lubridate)
library(plotly)
library(reshape2)  
library(hrbrthemes)

roper <- read_csv("Roper Wedding Cake Poll.csv")
roper$poll_year = mdy(roper$poll_year)


jpeg(paste0(getwd(),"/plots/poll_chart.jpeg"), 
     height = 6,
     width = 8,
     units = "in",
     res = 300)

ggplot(data = roper, aes(x=poll_year, y=Percent, group=Response, color=Response)) + 
  geom_point(size=1.3) +
  geom_line(linetype=5) +
  ylim(0,70) + 
  xlab("Interview Date (Day/Month/Year)") + 
  ylab("Percent") +
  ggtitle("Survey Responses, 2017-2019") +
  theme_ipsum() + 
  scale_color_manual(values = c("chartreuse3",
                                "red",
                                "azure4"))

dev.off()

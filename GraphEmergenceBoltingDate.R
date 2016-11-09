library(dplyr)
library(lubridate)
library(ggplot2)

#info <- read.table("\\\\Lindfs12\\home$\\Cfleit\\My Documents\\My papers\\2016-FodderBeetModel\\EmergenceBoltDates.txt", head=TRUE)

dataDir <- "C:\\GitHubRepos\\FodderBeetModel_FRNL\\"
info <- read.table(paste0(dataDir, "EmergenceBoltDates.txt"), head=TRUE)

info$Simulated <- dmy(info$Simulated)
info$Measured_mean <- dmy(info$Measured_mean)

head(info)

info %>%
  ggplot(aes(x=Simulated,y=Measured_mean,colour=factor(Experiment), shape = factor(Event))) +
  geom_point(size=5) +
  geom_abline(intercept=0,slope=1, linetype=2) +
  theme(legend.title=element_blank()) +
  ylab("Observed") + xlab("Simulated")
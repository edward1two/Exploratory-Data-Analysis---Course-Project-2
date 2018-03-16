# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# Setting the Working Directory
setwd("C:/Users/Shin/Documents/R")
 
# Using sqldf and ggplot package
library("sqldf")
library("ggplot2")

 
# Readng the data
NEI <- readRDS("summarySCC_PM25.rds")
 
#Summarizing the data
data <- sqldf("select NEI.type, NEI.year,sum(NEI.Emissions) as Emissions from NEI where NEI.fips = '24510' group by NEI.year,NEI.type  order by NEI.year")
 
# Plotting the data
qplot(year, Emissions, data=data, color=type, geom=c("line"), xlab = "year", ylab = "Emissions (tons)",main="Total Emissions PM2.5 Emissions by Type in Baltimore City, Maryland")

# Saving to a png file	 
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
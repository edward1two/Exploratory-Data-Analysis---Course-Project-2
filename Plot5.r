# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Setting the Working Directory
setwd("C:/Users/Shin/Documents/R")
 
# Using sqldf package
library("sqldf")
library("ggplot2")
 
# Readng the data
NEI <- readRDS("summarySCC_PM25.rds")
 
#Summarizing the data
data <- sqldf("select NEI.year,sum(NEI.Emissions) as Emissions from NEI 
where NEI.fips = '24510' 
and NEI.type = 'ON-ROAD'
group by NEI.year order by NEI.year")
 
# Plotting the data
qplot(year, Emissions, data=data, geom=c("line"), xlab = "year", ylab = "Emissions (tons)",main="Total PM2.5 Emissions of Motor Vehicle Sources in Baltimore")

	 
# Saving to a png file	 
dev.copy(png, file = "plot5.png", height = 480, width = 480)
dev.off()
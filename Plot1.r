# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.

# Setting the Working Directory
setwd("C:/Users/Shin/Documents/R")
 
# Using sqldf package
library("sqldf")
 
# Readng the data
NEI <- readRDS("summarySCC_PM25.rds")
 
#Summarizing the data
data <- sqldf("select NEI.year,sum(NEI.Emissions) as Emissions from NEI group by NEI.year order by NEI.year")
 
# Plotting the data
plot(data$year, data$Emissions, type = "l", main = "Total PM2.5 Emissions in U.S.", 
xlab = "Year", ylab = "Emissions (Tons)")
	 
# Saving to a png file	 
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
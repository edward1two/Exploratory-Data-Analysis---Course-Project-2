# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Setting the Working Directory
setwd("C:/Users/Shin/Documents/R")
 
# Using sqldf package
library("sqldf")
 
# Readng the data
NEI <- readRDS("summarySCC_PM25.rds")
 
#Summarizing the data
data <- sqldf("select NEI.year,sum(NEI.Emissions) as Emissions from NEI where NEI.fips = '24510' group by NEI.year order by NEI.year")
 
# Plotting the data
plot(data$year, data$Emissions, type = "l", main = "Total PM2.5 Emissions in Baltimore City, Maryland", 
xlab = "Year", ylab = "Emissions (Tons)")
	 
# Saving to a png file	 
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
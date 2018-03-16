# Across the United States, 
# how have emissions from coal combustion-related sources changed from 1999–2008?

# Setting the Working Directory
setwd("C:/Users/Shin/Documents/R")
 
# Using sqldf and ggplot package
library("sqldf")
library("ggplot2")

 
# Readng the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Summarizing the data

names(SCC) <- c("SCC","DataCategory","ShortName","EISector","OptionGroup","OptionSet","LevelOne","LevelTwo","LevelThree","LevelFour","Map","Year","Created","Revised","Usage")

data <- sqldf("select NEI.year,sum(NEI.Emissions) as Emissions from NEI,SCC 
where NEI.SCC = SCC.SCC and SCC.LevelOne like '%Combustion%' and SCC.LevelThree like '%Coal%' group by NEI.year order by NEI.year " )

 
# Plotting the data
qplot(year, Emissions, data=data, geom=c("line"), xlab = "year", ylab = "Emissions (tons)",main="Total PM2.5 Emissions from Coal Combustion-related Sources")


# Saving to a png file	 
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# Setting the Working Directory
setwd("C:/Users/Shin/Documents/R")
 
# Using sqldf package
library("sqldf")
library("ggplot2")
 
# Readng the data
NEI <- readRDS("summarySCC_PM25.rds")
 
#Summarizing the data
data <- sqldf("select NEI.year,sum(NEI.Emissions) as Emissions,
case when NEI.fips = '24510' then 'Baltimore'
when NEI.fips = '06037' then 'Los Angeles'
end as city
from NEI 
where NEI.fips = '24510' OR NEI.fips == '06037'
and NEI.type = 'ON-ROAD'
group by NEI.year , NEI.fips
order by city,NEI.year")
 
# Plotting the data
qplot(year, Emissions, data=data, color=city, geom=c("line"), xlab = "year", ylab = "Emissions (tons)",main="Total PM2.5 Emissions of Motor Vehicle Sources of Baltimore (24510) and Los Angeles (06037)")

	 
# Saving to a png file	 
dev.copy(png, file = "plot6.png", height = 480, width = 680)
dev.off()
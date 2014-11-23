##Question 3 
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
##Which have seen increases in emissions from 1999–2008? 
##Use the ggplot2 plotting system to make a plot answer this question.

##load ggplot2 library
library(ggplot2)

##Aggregate Emissions by year and filter “24510”

NEI.24510 <- NEI[which(NEI$fips == "24510"), ]
total.emissions.baltimore <- with(NEI.24510, aggregate(Emissions, by = list(year), 
                                                       sum))
colnames(total.emissions.baltimore) <- c("year", "Emissions")

##Aggregate Emissions by year, county, type and filter “24510”

total.emissions.baltimore.type <- ddply(NEI.24510, .(type, year), summarize, Emissions = sum(Emissions))
total.emissions.baltimore.type$Pollutant_Type <- total.emissions.baltimore.type$type

##Plot emissions per year grouped by source type using ggplot2 plotting system NON-ROAD, NONPOINT, ON-ROAD type sources have seen decreases in emissions. POINT type has seen increased emissions until year 2005 and then decreased. 

## Open the PNG device
png(filename='proj2plot3.png', width=480, height=480, units='px')

qplot(year, Emissions, data = total.emissions.baltimore.type, group = Pollutant_Type, 
      color = Pollutant_Type, geom = c("point", "line"), ylab = expression("Total Emissions, PM"[2.5]), 
      xlab = "Year", main = "Total Emissions in Baltimore City, Maryland by Type of Pollutant")

## Close the PNG device 
dev.off()

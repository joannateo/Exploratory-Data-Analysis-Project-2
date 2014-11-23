##Question 6
##Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == 06037). Which city has seen greater changes over time in motor vehicle emissions?

##Aggregate Emissions for the above SCC by year and county

motor.vehicle.emissions = NEI.DT[SCC %in% motor.vehicle.scc, sum(Emissions), 
                                 by = c("year", "fips")]
colnames(motor.vehicle.emissions) <- c("year", "fips", "Emissions")

##Open the PNG device

png(filename = "proj2plot6.png", width = 480, height = 480, units = "px")

##Plot emissions per year grouped by fips using ggplot2 plotting system Use log scale to plot rate of change. Observe steeper slopes for Baltimore City, indicating it has seen greater changes.

g = ggplot(motor.vehicle.emissions[fips == "24510" | fips == "06037"], aes(year, 
                                                                           log(Emissions)))
g + geom_point() + geom_line(aes(color = fips)) + scale_color_discrete(name = "County", 
                                                                       breaks = c("06037", "24510"), labels = c("Los Angeles", "Baltimore")) + 
        labs(x = "Year") + labs(y = expression("Log Scale of Total Emissions, PM"[2.5])) + labs(title = "Annual Motor Vehicle Emissions (Log Scale for rate of change)")

## Close the PNG device
dev.off()

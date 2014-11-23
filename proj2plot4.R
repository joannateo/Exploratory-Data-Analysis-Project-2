##Question 4
## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
##Obtain SCC codes for coal combustion related surces using SCC.Level.Three variable

coal.scc = SCC.DT[grep("Coal", SCC.Level.Three), SCC]

##Aggregate Emissions for the above SCC by year

coal.emissions = NEI.DT[SCC %in% coal.scc, sum(Emissions), by = "year"]
colnames(coal.emissions) <- c("year", "Emissions")

##Open the PNG device

png(filename = "proj2plot4.png", width = 480, height = 480, units = "px")

##Plot emissions per year using ggplot2 plotting system Emissions from coal combustion related sources decreased significantly from 1999-2008.

g = ggplot(coal.emissions, aes(year, Emissions))
g + geom_point(color = "red") + geom_line(color = "green") + labs(x = "Year") + labs(y = expression("Total Emissions, PM"[2.5])) + labs(title = "Emissions from Coal Combustion in the US")

## Close the PNG device 
dev.off()

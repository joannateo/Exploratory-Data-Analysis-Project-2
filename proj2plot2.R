##Question 2
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == 24510) from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.
##Aggregate Emissions by year and county and filter “24510”

NEI.24510 <- NEI[which(NEI$fips == "24510"), ]
total.emissions.baltimore <- with(NEI.24510, aggregate(Emissions, by = list(year), sum))
colnames(total.emissions.baltimore) <- c("year", "Emissions")

##Open the PNG device

png(filename = "proj2plot2.png", width = 480, height = 480, units = "px")

##Total emissions from PM2.5 on average decreased in the Baltimore City, Maryland from 1999 to 2008

plot(total.emissions.baltimore$year, total.emissions.baltimore$Emissions, type = "b", 
     pch = 18, col = "green", ylab = "Emissions", xlab = "Year", main = "Baltimore Emissions")

# Close the PNG device
dev.off()

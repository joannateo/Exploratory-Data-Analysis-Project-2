## Exploratory Data Analaysis COurse Project 2
##load required libraries

library(plyr)
library(ggplot2)
library(data.table)

## View working directory and make sure files to be read are in the same directory
getwd()

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Convert into data.table
NEI.DT = data.table(NEI)
SCC.DT = data.table(SCC)


##Question 1

##Aggreate emission per year

total.emissions <- with(NEI, aggregate(Emissions, by = list(year), sum))

##Open the PNG device

png(filename = "proj2plot1.png", width = 480, height = 480, units = "px")

##Plot emissions per year using basic package
##Total emissions from PM2.5 decreased in the United States from 1999 to 2008

plot(total.emissions, type = "b", pch = 18, col = "green", ylab = "Emissions", 
     xlab = "Year", main = "Annual Emissions")

## Close off the PNG device
dev.off()

# Exploratory Data Analysis
# Project 2
# Plot1

# Clean upworkspace
rm(list=ls())

library("plyr")

setwd("C:/Users/lgarcia/ExData_Project2")

# Load data
NEI <- readRDS("~/../ExData_Project2/summarySCC_PM25.rds")
SCC <- readRDS("~/../ExData_Project2/Source_Classification_Code.rds")

data<-transform(NEI,year=factor(year))

#Plot Data
plotdata<-ddply(data,.(year),summarize,sum=sum(Emissions))
png("plot1.png", width = 480, height = 480, units = 'px')
plot(plotdata$year,plotdata$sum,type="n",xlab="year",ylab="total PM2.5 Emission",boxwex=0.05)
lines(plotdata$year,plotdata$sum)
dev.off()
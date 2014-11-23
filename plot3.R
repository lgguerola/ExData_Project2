# Exploratory Data Analysis
# Project 2
# Plot 3 

# Clean upworkspace
rm(list=ls())

library("plyr")
library("ggplot2")

setwd("C:/Users/lgarcia/ExData_Project2")

# Load data
NEI <- readRDS("~/../ExData_Project2/summarySCC_PM25.rds")
SCC <- readRDS("~/../ExData_Project2/Source_Classification_Code.rds")

data<-transform(NEI,year=factor(year))
data2<-data[data$fips=="24510",]

#Plot Data
plotdata3<-ddply(data2,.(year,type),summarize,sum=sum(Emissions))
png("plot3.png")
gplot<-ggplot(plotdata3,aes(year,sum))
gplot+geom_point()+facet_grid(.~type)+labs(title="PM2.5 Emission in Baltimore city",
                                           y="total PM2.5 emission each year")
dev.off()
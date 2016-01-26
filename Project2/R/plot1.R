##  Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##  This program will produce a plot which will show the total PM2.5 emission from all
##  the sources for each of the years 1999, 2002, 2005 and 2008.
    
##  This first line will likely take a few seconds. Be patient!

    if(!exists("NEI")){
        NEI <- readRDS("./data/summarySCC_PM25.rds")
    }
    if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}
  
# Aggregate by sum the total emissions by year
    aggTotals <- aggregate(Emissions ~ year,NEI, sum)    

    png('plot1.png')
    
    barplot(
        (aggTotals$Emissions)/10^6,
        names.arg=aggTotals$year,
        xlab="Year",
        ylab="PM2.5 Emissions (10^6 Tons)",
        main="Total PM2.5 Emissions at various years"
    )
                           
    dev.off()
                           
                       
                           
                           



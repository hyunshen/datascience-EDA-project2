# Read data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Subset NEI data which corresponds to vehicles
vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
vehicleSCC <- SCC[vehicle, ]$SCC
vehicleNEI <- NEI[NEI$SCC %in% vehicleSCC, ]

# Subset Baltimore and Los Angeles County's data from vehicleNEI
baltimoreLA <- subset(vehicleNEI, fips == "24510" | fips == "06037")
baltimoreLA$City[baltimoreLA$fips == "24510"] <- "Baltimore City"
baltimoreLA$City[baltimoreLA$fips == "06037"] <- "Los Angeles County"

# Plot data
library(ggplot2)

png("plot6.png")
g <- ggplot(baltimoreLA, aes(factor(year), Emissions)) +
    facet_grid(. ~ City) + 
    geom_bar(stat = "identity") +
    ggtitle("PM2.5 Motor Vehicle Source Emissions in Baltimore City vs Los Angeles County") + 
    xlab("Year") + 
    ylab("PM2.5 Emissions (tons)")
print(g)
dev.off()
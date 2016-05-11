# Read data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Subset NEI data which corresponds to vehicles
vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
vehicleSCC <- SCC[vehicle, ]$SCC
vehicleNEI <- NEI[NEI$SCC %in% vehicleSCC, ]

# Subset Baltimore's data from vehicleNEI
baltimoreVehicle <- subset(vehicleNEI, fips == "24510")

# Plot data
library(ggplot2)
png("plot5.png")
g <- ggplot(baltimoreVehicle, aes(factor(year), Emissions)) +
    geom_bar(stat = "identity") + 
    ggtitle("PM2.5 Motor Vehicle Source Emissions in Baltimore") + 
    xlab("Year") + 
    ylab("PM2.5 Emissions (tons)")
print(g)
dev.off()
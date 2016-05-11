# Read data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Source ggplot2
library(ggplot2)

# Subset Baltimore data
baltimore <- subset(NEI, fips == "24510")

# Aggregate emissions by year
aggregated <- aggregate(Emissions ~ year + type, baltimore, sum)

# Plot data
png("plot3.png")
g <- ggplot(data = aggregated, aes(year, Emissions, color = type))
g <- g + geom_line() + 
    ylab("PM2.5 Emissions (tons)") + 
    ggtitle("Total PM2.5 Emissions in the Baltimore City For Each Year")
print(g)
dev.off()

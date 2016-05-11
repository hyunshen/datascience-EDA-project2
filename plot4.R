# Read data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Subset coal combustion related data
coal <- grepl("Coal", SCC$EI.Sector)
coalSCC <- SCC[coal, ]$SCC
coalNEI <- NEI[NEI$SCC %in% coalSCC, ]

# Plot data
library(ggplot2)

png("plot4.png")
g <- ggplot(coalNEI,aes(factor(year),Emissions / 10^5)) +
    geom_bar(stat = "identity") + 
    ggtitle("PM2.5 Coal Combustion Source Emissions Across US") + 
    xlab("Year") + 
    ylab("PM2.5 Emissions (10^5 tons)")
print(g)
dev.off()



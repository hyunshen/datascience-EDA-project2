# Read data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Subset Baltimore data
baltimore <- subset(NEI, fips == "24510")

# Aggregate emissions by year
aggregated <- aggregate(Emissions ~ year, baltimore, sum)

# Plot data
png("plot2.png")
barplot(
    aggregated$Emissions,
    names.arg=aggregated$year,
    xlab="Year",
    ylab="PM2.5 Emissions (tons)",
    main="Total PM2.5 Emissions in the Baltimore City For Each Year"
)
dev.off()
# Read data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Aggregate emissions by year
aggregated <- aggregate(Emissions ~ year, NEI, sum)

# Plot data
png("plot1.png")
barplot(
    (aggregated$Emissions)/10^6,
    names.arg=aggregated$year,
    xlab="Year",
    ylab="PM2.5 Emissions (10^6 tons)",
    main="Total PM2.5 Emissions From All Sources For Each Year"
)
dev.off()
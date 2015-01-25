NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")


NEIsubset <- NEI[sample(nrow(NEI), size = 6000, replace = F), ]


BM <- subset(NEI, fips == '24510')

png(filename = 'plot2.png')
barplot(tapply(X = BM$Emissions, INDEX = BM$year, FUN = sum), main = 'Total Emission in Baltimore City,Maryland', xlab = 'Year', ylab = expression('PM'[2.5]))
dev.off()

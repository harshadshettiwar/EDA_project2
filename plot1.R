NEI<- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


NEIsubset <- NEI[sample(nrow(NEI), size = 1000, replace = F), ]


Pollution <- aggregate(NEI[, 'Emissions'], by = list(NEI$year), FUN = sum)
Emissions$PM <- round(Emissions[, 2] / 1000, 2)

png(filename = "plot1.png")
barplot(Emissions$PM, names.arg = Emissions$Group.1, main = expression('Total Emission PM 2.5 Across Years'), xlab = 'Year', ylab = expression(paste('PM', ''[2.5])))
dev.off()

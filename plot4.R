NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")


SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE), ]


combined <- merge(x = NEI, y = SCC.coal, by = 'SCC')
combined.sum <- aggregate(combined[, 'Emissions'], by = list(combined$year), sum)
colnames(combined.sum) <- c('Year', 'Emissions')

png(filename = 'plot4.png')
ggplot(data = combined.sum, aes(x = Year, y = Emissions / 1000)) + geom_line(aes(group = 1, col = Emissions)) + geom_point(aes(size = 2, col = Emissions)) + ggtitle(expression('Total Emissions of PM[2.5] Across US')) + ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + geom_text(aes(label = round(Emissions / 1000, digits = 2), size = 2, hjust = 1.5, vjust = 1.5)) + theme(legend.position = 'none') + scale_colour_gradient(low = 'black', high = 'red')
dev.off()

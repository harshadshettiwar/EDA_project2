NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels = c('1999', '2002', '2005', '2008'))


BM.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')


BM.df <- aggregate(BM.onroad[, 'Emissions'], by = list(BM.onroad$year), sum)
colnames(BM.df) <- c('year', 'Emissions')

png('plot5.png')
ggplot(data = BM.df, aes(x = year, y = Emissions)) + geom_bar(aes(fill = year), stat = "identity") + guides(fill= F) + ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position = 'none') + geom_text(aes(label = round(Emissions, 0), size = 1, hjust = 0.5, vjust = 2))
dev.off()

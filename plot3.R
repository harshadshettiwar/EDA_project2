require(ggplot2)

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

NEIsample <- NEI[sample(nrow(NEI), size = 6000, replace = F), ]


BM <- subset(NEI, fips == 24510)
BM$year <- factor(BM$year, levels = c('1999', '2002', '2005', '2008'))

png('plot3.png', width = 800, height = 500, units = 'px')
ggplot(data = BM, aes(x = year, y = log(Emissions))) + facet_grid(. ~ type) + guides(fill = F) + geom_violin(aes(fill = type)) + stat_boxplot(geom = 'errorbar') + ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + ggtitle('Emissions per Type in Baltimore City') + geom_jitter(alpha = 0.10)
dev.off()



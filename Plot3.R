library(ggplot2)

#Loading data

a<-readRDS("C:/Users/conni/Documents/summarySCC_PM25.rds")
b<-readRDS("C:/Users/conni/Documents/Source_Classification_Code.rds")

a_sample <- a[sample(nrow(a), size=5000, replace=F), ]

BC <- subset(a, fips=='24510')
BC$year <- factor(BC$year, levels=c('1999', '2002', '2005', '2008'))

#Generate graph
png(filename='C:/Users/conni/Documents/plot3.png', width=800, height=500, units='px')

ggplot(data=BC, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
  geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
  ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + 
  ggtitle('Emissions per Type in Baltimore') +
  geom_jitter(alpha=0.10)

dev.off()

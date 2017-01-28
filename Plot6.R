library(ggplot2)

#Loading data

a<-readRDS("C:/Users/conni/Documents/summarySCC_PM25.rds")
b<-readRDS("C:/Users/conni/Documents/Source_Classification_Code.rds")

a$year <- factor(a$year, levels=c('1999', '2002', '2005', '2008'))

BC.OR <- subset(a, fips == '24510' & type == 'ON-ROAD')
LA.OR <- subset(a, fips == '06037'& type == 'ON-ROAD')

#Aggregate
BC<- aggregate(BC.OR[, 'Emissions'], by=list(BC.OR$year), sum)
colnames(BC) <- c('year', 'Emissions')
BC$City <- paste(rep('BC', 4))

LA <- aggregate(LA.OR[, 'Emissions'], by=list(LA.OR$year), sum)
colnames(LA) <- c('year', 'Emissions')
LA$City <- paste(rep('LA', 4))

DF <- as.data.frame(rbind(BC, LA))

#Generate graph
png(filename='C:/Users/conni/Documents/plot6.png')

ggplot(data=DF, aes(x=year, y=Emissions)) + geom_bar(stat="identity") + guides(fill=F) + 
  ggtitle('Total Emissions of Motor Vehicle from Los Angeles & Baltimore') + 
  ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + facet_grid(. ~ City)  
  
dev.off()

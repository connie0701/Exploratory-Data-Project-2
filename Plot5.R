library(ggplot2)

#Loading data

a<-readRDS("C:/Users/conni/Documents/summarySCC_PM25.rds")
b<-readRDS("C:/Users/conni/Documents/Source_Classification_Code.rds")

a$year <- factor(a$year, levels=c('1999', '2002', '2005', '2008'))

BC.OR <- subset(a, fips == '24510' & type == 'ON-ROAD')

BC <- aggregate(BC.OR[, 'Emissions'], by=list(BC.OR$year), sum)
colnames(BC) <- c('year', 'Emissions')


#Generate graph
png(filename='C:/Users/conni/Documents/plot5.png')

ggplot(data=BC, aes(x=year, y=Emissions)) + geom_bar(stat="identity") + guides(fill=F) + 
  ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore') + 
  ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none')
                    
                    
dev.off()

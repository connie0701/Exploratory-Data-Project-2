#Loading data

a<-readRDS("C:/Users/conni/Documents/summarySCC_PM25.rds")
b<-readRDS("C:/Users/conni/Documents/Source_Classification_Code.rds")

a_sample <- a[sample(nrow(a), size=5000, replace=F), ]

BC <- subset(a, fips=='24510')

#Generate graph
png(filename='C:/Users/conni/Documents/plot2.png')

barplot(tapply(X=BC$Emissions, INDEX=BC$year, FUN=sum), 
        main='Total Emission in Baltimore', 
        xlab='Year', ylab=expression('PM'[2.5]))
dev.off()

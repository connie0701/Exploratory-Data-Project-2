#Loading data

a<-readRDS("C:/Users/conni/Documents/summarySCC_PM25.rds")
b<-readRDS("C:/Users/conni/Documents/Source_Classification_Code.rds")

a_sample<-a[sample(nrow(a),size=2000,replace=F)]

Emission <- aggregate(a[, 'Emissions'], by=list(a$year), FUN=sum)
Emission$PM <- round(Emission[,2]/1000,2)

#Generate graph
png(filename='C:/Users/conni/Documents/plot1.png')
barplot(Emission$PM, names.arg=Emission$Group.1,
        main=expression('Total Emission of PM'[2.5]),
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()

setwd('C:/Coursera/Exploratory Data Analysis/exdata/')
ex.data<-read.csv('C:/Coursera/Exploratory Data Analysis/exdata/household_power_consumption.txt',sep=';',na.strings='?',stringsAsFactors=FALSE)
ex.data$datetimetext<-paste(ex.data$Date,ex.data$Time)
ex.data$datetime<-as.POSIXct(ex.data$datetimetext,format='%d/%m/%Y %H:%M:%S',tz='UTC')
ex.data<-ex.data[ex.data$datetime >=as.POSIXct('2007-02-01',tz='UTC') & ex.data$datetime < as.POSIXct('2007-02-03',tz='UTC'),]
png('plot1.png',height=480,width=480)
hist(ex.data$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)',ylab='Frequency')
dev.off()
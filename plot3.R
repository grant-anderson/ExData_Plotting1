setwd('C:/Coursera/Exploratory Data Analysis/exdata/')
ex.data<-read.csv('C:/Coursera/Exploratory Data Analysis/exdata/household_power_consumption.txt',sep=';',na.strings='?',stringsAsFactors=FALSE)
ex.data$datetimetext<-paste(ex.data$Date,ex.data$Time)
ex.data$datetime<-as.POSIXct(ex.data$datetimetext,format='%d/%m/%Y %H:%M:%S',tz='UTC')
ex.data<-ex.data[ex.data$datetime >=as.POSIXct('2007-02-01',tz='UTC') & ex.data$datetime < as.POSIXct('2007-02-03',tz='UTC'),]
png('plot3.png',height=480,width=480)
plot(ex.data$datetime,ex.data$Sub_metering_1,type='l',col='black',ylab='Energy sub metering',xlab='')
lines(ex.data$datetime,ex.data$Sub_metering_2,col='red')
lines(ex.data$datetime,ex.data$Sub_metering_3,col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=1)
dev.off()

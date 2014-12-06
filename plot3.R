# Plot 3

plot3 <- function(filename) {

#read data
suppressWarnings(data<- fread(filename, na.strings="?"))

#subset based on date range
date_1<-as.Date(data$Date,format="%d/%m/%Y")
data1<-data[date_1>="2007-02-01" & date_1<="2007-02-02"]

#Add column for date & time
dt<-paste(data1$Date,data1$Time)
datetime<-strptime(dt,format="%d/%m/%Y %H:%M:%S")

#create vectors with Y data
y1 <-as.numeric(data1$Sub_metering_1)
y2 <-as.numeric(data1$Sub_metering_2)
y3 <-as.numeric(data1$Sub_metering_3)


#create plot and image file
png(filename="plot3.png")
plot(datetime,y1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(datetime,y2,type="l",col="red")
lines(datetime,y3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

}
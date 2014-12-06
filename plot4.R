#plot #4

plot4 <- function(filename) {
  
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
  globalactive <-as.numeric(data1$Global_active_power)
  voltage <-as.numeric(data1$Voltage)
  Global_reactive_power <-as.numeric(data1$Global_reactive_power)
  
  #create plot and image file
  png(filename="plot4.png")
  
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,0,0))
  
  #plot 1
    plot(datetime,globalactive,type="l",xlab="",ylab="Global Active Power")
  
  #Plot 2
    plot(datetime,voltage,type="l",xlab="datetime")
  
  #Plot 3
    plot(datetime,y1,type="l",col="black",xlab="",ylab="Energy sub metering")
    lines(datetime,y2,type="l",col="red")
    lines(datetime,y3,type="l",col="blue")
    legend("topright",lty=1,col=c("black","red","blue"),bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #Plot 4
    plot(datetime,Global_reactive_power,type="l",xlab="datetime")
  
  dev.off()
  
}
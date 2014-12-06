# Plot 2 - Time series

plot2 <- function(filename) {
  
  #read data
  data<- fread(filename, na.strings="?")
  
  #subset based on date range
  date_1<-as.Date(data$Date,format="%d/%m/%Y")
  data1<-data[date_1>="2007-02-01" & date_1<="2007-02-02"]
  
  #Add column for date & time
  dt<-paste(data1$Date,data1$Time)
  datetime<-strptime(dt,format="%d/%m/%Y %H:%M:%S")
  
  #create plot and image file
  png(filename="plot2.png")
  plot(datetime,data1$Global_active_power,type="l",xlab="")
  dev.off()
  
}
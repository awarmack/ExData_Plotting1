#Plot 1 - Histogram

plot1 <- function(filename) {
  
data<- fread(filename, na.strings="?")
data[,date_1:=as.Date(Date,format="%d/%m/%Y")]
data1<-data[data$date_1>="2007-02-01" & data$date_1<="2007-02-02"]

png(filename="plot1.png")
with(data1, hist(as.numeric(Global_active_power), 
                 col="red", 
                 main="Global Active Power", 
                 xlab="Global Active Power (kilowatts)"))
dev.off()

}

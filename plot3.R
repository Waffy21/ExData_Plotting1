plot3 <- function(){
  
  ##setwd("Curso 4")
  datos <- read.csv("household_power_consumption.csv", sep=";") ##Read the file
  datos$Date <- strptime(datos$Date, "%d/%m/%Y")
  datos2 <- subset(datos, Date > "2007-01-31")
  datos3 <- subset(datos2, Date < "2007-02-03")
  ##Jue = Thursday, and Vie = Friday. That's because it shows the weekdays in Spanish
  datos3$DateTime <- as.POSIXct(paste(datos3$Date, datos3$Time), format="%Y-%m-%d %H:%M:%S") ##Paste Time and Date columns
  datos3$Sub_metering_1 <- as.numeric(as.character(datos3$Sub_metering_1)) ##Transform the column to numeric
  datos3$Sub_metering_2 <- as.numeric(as.character(datos3$Sub_metering_2)) ##Transform the column to numeric
  datos3$Sub_metering_3 <- as.numeric(as.character(datos3$Sub_metering_3)) ##Transform the column to numeric
  plot(datos3$DateTime, datos3$Sub_metering_1/1000, type="l",xlab="",ylab = "Energy sub metering", col="black")
  lines(datos3$DateTime, datos3$Sub_metering_2/1000, type= "l", col="red")
  lines(datos3$DateTime, datos3$Sub_metering_3/1000, type= "l", col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","red", "blue"), lty=1, cex=0.8)
  dev.copy(png,'plot3.png')##Save PNG
  dev.off()
}
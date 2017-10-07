plot4 <- function(){
  datos <- read.csv("household_power_consumption.csv", sep=";") ##Read the file
  datos$Date <- strptime(datos$Date, "%d/%m/%Y")
  datos2 <- subset(datos, Date > "2007-01-31")
  datos3 <- subset(datos2, Date < "2007-02-03")
  ##Jue = Thursday, and Vie = Friday. That's because it shows the weekdays in Spanish
  datos3$DateTime <- as.POSIXct(paste(datos3$Date, datos3$Time), format="%Y-%m-%d %H:%M:%S") ##Paste Time and Date columns
  ##Set the plotting area
  par(mfrow=c(2,2))
  ##Plotting the global active power
  datos3$Global_active_power <- as.numeric(as.character(datos3$Global_active_power)) ##Transform the column to numeric
  plot(datos3$DateTime, datos3$Global_active_power/1000,ylab="Global Active Power",xlab="", type="l")
  ##Plotting the voltage
  datos3$Voltage <- as.numeric(as.character(datos3$Voltage)) ##Transform the column to numeric
  plot(datos3$DateTime, datos3$Voltage/1000,xlab="datetime", ylab="Voltage", type="l")

  ##Plotting the sub_metering
  datos3$Sub_metering_1 <- as.numeric(as.character(datos3$Sub_metering_1)) ##Transform the column to numeric
  datos3$Sub_metering_2 <- as.numeric(as.character(datos3$Sub_metering_2)) ##Transform the column to numeric
  datos3$Sub_metering_3 <- as.numeric(as.character(datos3$Sub_metering_3)) ##Transform the column to numeric
  plot(datos3$DateTime, datos3$Sub_metering_1/1000, type="l",xlab="",ylab = "Energy sub metering", col="black")
  lines(datos3$DateTime, datos3$Sub_metering_2/1000, type= "l", col="red")
  lines(datos3$DateTime, datos3$Sub_metering_3/1000, type= "l", col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","red", "blue"), lty=1, cex=0.4)
  ##Plotting the global reactive power
  datos3$Global_reactive_power <- as.numeric(as.character(datos3$Global_reactive_power)) ##Transform the column to numeric
  plot(datos3$DateTime, datos3$Global_reactive_power/1000,xlab="datetime", ylab="Global Reactive Power", type="l")
  dev.copy(png,'plot4.png')##Save PNG
  dev.off()
}
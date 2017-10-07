plot2<-function(){
  
  ##setwd("Curso 4")
  datos <- read.csv("household_power_consumption.csv", sep=";") ##Read the file
  datos$Date <- strptime(datos$Date, "%d/%m/%Y")
  datos2 <- subset(datos, Date > "2007-01-31")
  datos3 <- subset(datos2, Date < "2007-02-03")
  ##Jue = Thursday, and Vie = Friday. That's because it shows the weekdays in Spanish
  datos3$Global_active_power <- as.numeric(as.character(datos3$Global_active_power)) ##Transform the column to numeric
  datos3$DateTime <- as.POSIXct(paste(datos3$Date, datos3$Time), format="%Y-%m-%d %H:%M:%S") ##Paste Time and Date columns
  plot(datos3$DateTime, datos3$Global_active_power,xlab="",ylab ="Global Active Power (kilowatts)",  type="l")
  dev.copy(png,'plot2.png')##Save PNG
  dev.off()
}

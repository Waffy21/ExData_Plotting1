plot1 <- function() 
{
  ##setwd("Curso 4")
  datos <- read.csv("household_power_consumption.csv", sep=";") ##Read the file
  datos$Date <- strptime(datos$Date, "%d/%m/%Y")
  datos2 <- subset(datos, Date > "2007-01-31")
  datos3 <- subset(datos2, Date < "2007-02-03")
  datos3$Global_active_power <- as.numeric(as.character(datos3$Global_active_power)) ##Transform the column to numeric
  hist((datos3$Global_active_power)/1000, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red", ylim = c(0, 1200))
  dev.copy(png,'plot1.png') ##Save PNG
  dev.off()
}
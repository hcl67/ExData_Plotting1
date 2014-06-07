# set locale time 
Sys.setlocale("LC_TIME", "US")

# read data
data <- read.table("household_power_consumption.txt",sep=";",header=T, na.string="?")
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ] 
data$DT <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# plot
png("plot3.png")
with(data,{
  plot(DT, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l", col = "black")
  lines(DT, Sub_metering_2, col = "red")
  lines(DT, Sub_metering_3, col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
} )
dev.off()

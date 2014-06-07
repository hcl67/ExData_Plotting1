# set locale time 
Sys.setlocale("LC_TIME", "US")

# read data
data <- read.table("household_power_consumption.txt",sep=";",header=T, na.string="?")
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ] 
data$DT <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# plot
png("plot2.png")
with(data, plot(DT, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l"))
dev.off()

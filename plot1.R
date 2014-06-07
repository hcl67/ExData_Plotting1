# set locale time 
Sys.setlocale("LC_TIME", "US")

# read data
data <- read.table("household_power_consumption.txt",sep=";",header=T, na.string="?")
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ] 
data$DT <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# plot
png("plot1.png")
hist(data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")  
dev.off()


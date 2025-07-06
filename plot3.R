# Load and preprocess data
data_file <- "household_power_consumption.txt"
data <- read.table(data_file, header = TRUE, sep = ";", na.strings = "?", 
                   stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
subset_data$Datetime <- strptime(paste(subset_data$Date, subset_data$Time), 
                                 format="%Y-%m-%d %H:%M:%S")

# Plot
png("plot3.png", width = 480, height = 480)
plot(subset_data$Datetime, subset_data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(subset_data$Datetime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$Datetime, subset_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
dev.off()

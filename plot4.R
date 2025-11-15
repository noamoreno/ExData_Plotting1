# plot4.R
data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";", na.strings = "?",
                   stringsAsFactors = FALSE)
df <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

df$DateTime <- as.POSIXlt(strptime(paste(df$Date, df$Time),
                                   "%d/%m/%Y %H:%M:%S"))
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

#Global Active Power
plot(df$DateTime, df$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power", xaxt = "n")
axis(1, at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),
     labels = c("Thu", "Fri", "Sat"))
#Voltage
plot(df$DateTime, df$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis(1, at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),
     labels = c("Thu", "Fri", "Sat"))
#Sub metering
plot(df$DateTime, df$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(df$DateTime, df$Sub_metering_2, col = "red")
lines(df$DateTime, df$Sub_metering_3, col = "blue")
axis(1, at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),
     labels = c("Thu", "Fri", "Sat"))
legend("topright", bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
#Global Reactive Power
plot(df$DateTime, df$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global Reactive Power", xaxt = "n")
axis(1, at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),
     labels = c("Thu", "Fri", "Sat"))

dev.off()

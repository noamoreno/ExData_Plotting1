# plot3.R
data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";", na.strings = "?",
                   stringsAsFactors = FALSE)

df <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

df$DateTime <- as.POSIXlt(strptime(paste(df$Date, df$Time),
                                   "%d/%m/%Y %H:%M:%S"))
png("plot3.png", width = 480, height = 480)
plot(df$DateTime, df$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(df$DateTime, df$Sub_metering_2, col = "red")
lines(df$DateTime, df$Sub_metering_3, col = "blue")
axis(1, at = as.POSIXct(c("2007-02-01 00:00:00",
                          "2007-02-02 00:00:00",
                          "2007-02-03 00:00:00")),labels = c("Thu", "Fri", "Sat"))

legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
dev.off()

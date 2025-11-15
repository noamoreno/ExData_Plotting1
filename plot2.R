# plot2.R
data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";", na.strings = "?",
                   stringsAsFactors = FALSE)
df <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
df$DateTime <- as.POSIXct(strptime(paste(df$Date, df$Time),
                                   "%d/%m/%Y %H:%M:%S"))
png("plot2.png", width = 480, height = 480)
plot(df$DateTime, df$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)",
     xaxt = "n")
axis(1, at = as.POSIXct(c("2007-02-01 00:00:00",
                          "2007-02-02 00:00:00",
                          "2007-02-03 00:00:00")),labels = c("Thu", "Fri", "Sat"))

dev.off()

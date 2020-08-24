df <- read.csv2("household_power_consumption.txt")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
start <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")
df <- df[df$Date >= start & df$Date <= end, ]
df$DateTime <- strptime(paste(df$Date, df$Time),
                        format="%Y-%m-%d %H:%M:%S"
)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)
df$Global_active_power <-
  as.numeric(df$Global_active_power)
df$Global_reactive_power <-
  as.numeric(df$Global_reactive_power)
df$Voltage <- as.numeric(df$Voltage)
png(file="plot4.png")
par(mfrow=c(2,2))
plot(df$DateTime, df$Global_active_power, xlab="",
      ylab="Global Active Power", type="l")
plot(df$DateTime, df$Voltage, xlab="datetime",
      ylab="Voltage", type="l"
      )
plot(df$DateTime, df$Sub_metering_1, xlab="",
      ylab="Energy sub metering", type="l")
lines(df$DateTime, df$Sub_metering_2, col="red")
lines(df$DateTime, df$Sub_metering_3, col="blue")
legend("topright", legend=colnames(df[, 7:9]),
       col=c("black", "red", "blue"),
       lty=1
)
plot(df$DateTime, df$Global_reactive_power,
      xlab="datetime", ylab="Global Reactive Power",
      type="l"
      )
dev.off()

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
png(file="plot3.png")
plot(df$DateTime, df$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering"
     )
lines(df$DateTime, df$Sub_metering_2, col="red")
lines(df$DateTime, df$Sub_metering_3, col="blue")
legend("topright", legend=colnames(df[, 7:9]),
       col=c("black", "red", "blue"),
       lty=1
       )
dev.off()

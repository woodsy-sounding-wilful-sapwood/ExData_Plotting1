df <- read.csv2("household_power_consumption.txt")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
start <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")
df <- df[df$Date >= start & df$Date <= end, ]
df$DateTime <- strptime(paste(df$Date, df$Time),
                        format="%Y-%m-%d %H:%M:%S"
)
df$Global_active_power <-
  as.numeric(df$Global_active_power)
png(file="plot2.png")
plot(df$DateTime, df$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)"
     )
dev.off()

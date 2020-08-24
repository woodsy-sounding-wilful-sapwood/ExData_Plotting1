df <- read.csv2("household_power_consumption.txt")
df$Date <- df$Date <- as.Date(df$Date, format="%d/%m/%Y")
start <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")
df <- df[df$Date >= start & df$Date <= end, ]
df$Global_active_power <-
  as.numeric(df$Global_active_power)
png(file="plot1.png")
hist(df$Global_active_power, col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts",
     ylab="Frequency"
     )
dev.off()

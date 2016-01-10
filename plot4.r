setwd("~/JHU Data Science/4Exploratory Data Analysis/Assignment1/exdata-data-household_power_consumption")

power <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, na.strings = "?", header = TRUE)

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

#Plot4
par(mfrow = c(2,2))
with(df,plot(timestamp,Global_active_power, type = "l", xlab ="", ylab = "Global Active Power"))
with(df,plot(timestamp,Voltage, type = "l", xlab ="datetime", ylab = "Voltage"))
with(df,plot(timestamp,Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering"))
lines(df$timestamp, df$Sub_metering_2, col = "red")
lines(df$timestamp, df$Sub_metering_3, col = "blue")
legend("topright", col=c("black","red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"),
       lty = c(1,1),
       lwd = c(1,1),
       bty="n", 
       cex=.5
)
with(df,plot(timestamp,Global_reactive_power, type = "l", xlab ="datetime", ylab = "Global_reactive_power"))

dev.copy(png,file = "plot4.png",width=480, height=480)
dev.off()



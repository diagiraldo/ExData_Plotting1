dat <-read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses=c, na.strings="?")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat <- subset(dat, (Date >= "2007-02-01" & Date <= "2007-02-02"))
dat$Time2 <- strptime(with(dat, paste(Date, Time)), format="%Y-%m-%d %H:%M:%S")
png("plot3.png")
with(dat, plot(Time2, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(dat, lines(Time2, Sub_metering_1, col="black"))
with(dat, lines(Time2, Sub_metering_2, col="red"))
with(dat, lines(Time2, Sub_metering_3, col="blue"))
legend("topright", col=c("black", "red", "blue"), legend=names(dat)[7:9], lty=c(1,1))
dev.off()
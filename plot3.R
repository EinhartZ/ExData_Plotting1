library(dplyr);
##Load data
file <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")));
##Clean data
file$Date <- as.Date(file$Date, format = "%d/%m/%Y");
file$timetemp <- paste(file$Date, file$Time);
file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S");
##Filter data
data <- file[which(file$Date %in% as.Date(c('2007-2-1', '2007-2-2'))),];

##plot3
png("plot3.png");
plot(data$Time, data$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_1, col="black")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col=c("black", "red","blue"))
dev.off();
library(dplyr);
##Load data
file <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")));
##Clean data
file$Date <- as.Date(file$Date, format = "%d/%m/%Y");
file$timetemp <- paste(file$Date, file$Time);
file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S");
##Filter data
data <- file[which(file$Date %in% as.Date(c('2007-2-1', '2007-2-2'))),];

##plot2
png("plot2.png");
plot(data$Time, data$Global_active_power, type="l", xlab = "", ylab = "Global active power (klowatts)");
dev.off();
#Load csv file
data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                      stringsAsFactors=FALSE, na.strings = "?", dec=".")

#Format Date accordingly
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Subset data to date ranges as given below
data_subset <-subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

#Combine Date + Time into a column
data_subset$DT <- as.POSIXct(paste(data_subset$Date, data_subset$Time, seperator = " "))

#Export plot to 480 x 480 .png image
png("plot3.png", height = 480, width = 480)

#Output plot to view within RStudio enviornment with appropriate y-label
plot(data_load_subset$Sub_metering_1~data_load_subset$TS, type = "l", ylab = "Energy sub metering", xlab = "")

#add lines to the graph
lines(data_subset$DT, data_subset$Sub_metering_2, col = "red")
lines(data_subset$DT, data_subset$Sub_metering_3, col = "blue")

#Add legend to topright with appropriate colors
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col=c("black", "red", "blue"))

dev.off()

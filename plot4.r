#Load csv file
data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                      stringsAsFactors=FALSE, na.strings = "?", dec=".")

#Format Date accordingly
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Subset data to date ranges as given below
data_subset <-subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

#Combine Date + Time into a column
data_subset$DT <- as.POSIXct(paste(data_subset$Date, data_subset$Time, seperator = " "))

#Export image of the plots to 480 x 480 png
png("plot4.png", height = 480, width = 480)

#Prepare image for 2x2 plot arrangement
par(mfrow = c(2, 2))

#Add to plots
with(data_load_subset, {
  #plot the 3 graphs in the RStudio environment
  plot(data_subset$Global_active_power~data_subset$DT, type = "l", ylab = "Global Active Power", xlab = "")
  plot(data_subset$Voltage~data_subset$DT, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(data_subset$Sub_metering_1~data_subset$DT, type = "l", ylab = "Energy sub metering", xlab = "")
  
  #Adds the lines and legend to Plot 3
  lines(data_subset$DT, data_subset$Sub_metering_2, col = "red")
  lines(data_subset$DT, data_subset$Sub_metering_3, col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col=c("black", "red", "blue"), bty="n")
  
  #Outputs Plot 4
  plot(data_subset$Global_reactive_power~data_subset$DT, type = "l", ylab = "Global_reactive_power", xlab = "datetime")  
  
})

dev.off()

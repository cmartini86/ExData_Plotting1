#Load csv file
data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                      stringsAsFactors=FALSE, na.strings = "?", dec=".")

#Format Date accordingly
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
##data_load$Time <- as.POSIXct(data_load$Time, format = "%H:%M:%s")

#Subset data to date ranges as given below
data_load_subset <-subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

#Combine Date + Time into a column
data_subset$DT <- as.POSIXct(paste(data_subset$Date, data_subset$Time, seperator = " "))

#Export plot to 480 x 480 .png image
png("plot2.png", height = 480, width = 480)

#Output plot to view within RStudio enviornment with appropriate y-label
plot(data_subset$Global_active_power~data_subset$DT, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()

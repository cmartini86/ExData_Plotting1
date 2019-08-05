#Load .txt as .csv
data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?", dec=".")

#Format Date accordingly
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Subset data to date ranges as given below
data_subset <-subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")


#Combine Date + Time into a column
data_subset$DT <- as.POSIXct(paste(data_subset$Date, data_subset$Time))


#Export plot to 480 x 480 .png image
png("plot1.png", height = 480, width = 480)

#Output plot to view within RStudio enviornment with appropriate labels
hist(data_subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

dev.off()


# Download zip file via URL
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f   <- file.path(getwd(), "household_power_consumption.zip")
download.file(url, f)

# Unzip file
zipF <- "C:\\R projects\\ExData_Plotting1\\household_power_consumption.zip"
outDir <-"C:\\R projects\\ExData_Plotting1"
unzip(zipF,exdir=outDir)

# Read data file 
household_power_consumption <- read.csv("C:\\R projects\\ExData_Plotting1\\household_power_consumption.txt", 
                                        header = T, na.strings = "?", stringsAsFactors = F, sep = ";")

# Select time frame
library('dplyr')
month_household_power_consumption <- household_power_consumption %>%
      filter(Date %in% c("1/2/2007","2/2/2007"))

# Plot 1
# Histogram
hist(month_household_power_consumption$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", 
     col="Red", main="Global Active Power")

# Save plot 1 as png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

# Plot 2
datetime <- strptime(paste(month_household_power_consumption$Date, 
                           month_household_power_consumption$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S")
plot(datetime, month_household_power_consumption$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Save plot 2 as png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

# Plot 3
with(month_household_power_consumption, {
      plot(datetime, Sub_metering_1, 
           type="l", xlab="", ylab="Global Active Power (kilowatts)", col = "black")
      lines(datetime, Sub_metering_2, col = "red")
      lines(datetime, Sub_metering_3, col = "blue")
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save plot 3 as png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

# Plot 4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(month_household_power_consumption, {
      plot(datetime, Global_active_power, type="l", 
           ylab="Global Active Power (kilowatts)", xlab="")
      
      plot(datetime, Voltage, type="l", 
           ylab="Voltage (volt)", xlab="")
      
      plot(datetime, Sub_metering_1, type="l", 
           ylab="Global Active Power (kilowatts)", xlab="")
      lines(datetime, Sub_metering_2,col='Red')
      lines(datetime, Sub_metering_3,col='Blue')
      legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
             legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      
      plot(datetime, Global_reactive_power, type="l", 
           ylab="Global Rective Power (kilowatts)",xlab="")
})

# Save plot 4 as png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
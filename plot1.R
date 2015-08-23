# This file will create a plot using the "household_power_consumption.txt" data
# First the data will be read into a dataframe called datamain using read.csv2

# datamain<-read.table("household_power_consumption.txt", stringsAsFactors = FALSE)
datamain<-read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE, na.strings = "?")

d1<-subset(datamain, Date == "1/2/2007" | Date == "2/2/2007")
d2<-d1

# Combine the date and time into a single column
d2$DT<-paste(d2$Date,d2$Time)

# Convert the date and time to a POSIXCT type
d2$DT2<-strptime(d2$DT, format ="%d/%m/%Y %H:%M:%S")

d2$Global_active_power<-as.numeric(d2$Global_active_power)


d2$Global_reactive_power<-as.numeric(d2$Global_reactive_power)
d2$Voltage<-as.numeric(d2$Voltage)
d2$Global_intensity<-as.numeric(d2$Global_intensity)
d2$Sub_metering_1<-as.numeric(d2$Sub_metering_1)
d2$Sub_metering_2<-as.numeric(d2$Sub_metering_2)
d2$Sub_metering_3<-as.numeric(d2$Sub_metering_3)

png(filename = "plot1.png")

hist(d2$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

dev.off()

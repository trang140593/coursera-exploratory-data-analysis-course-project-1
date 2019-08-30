# Coursera Data Science: Exploratory Data Analysis
# Course project 1: Plot3
# Student name: Bui Thi Thien Trang
################################################################################
rm(list = ls())
#read data following its directory
data_full=read.table('/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 1/household_power_consumption.txt',
                     sep = ";",header = T, stringsAsFactors=FALSE, dec=".")
#Convert the date variable to Date class
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

#Subsetting the data
data_sub <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

#Converting dates
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)

#Plot 3
png(filename="/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 1/plot3.png",width = 480, height = 480)
with(data_sub, {
  plot(data_sub$Sub_metering_1~data_sub$Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(data_sub$Sub_metering_2~data_sub$Datetime,col='Red')
  lines(data_sub$Sub_metering_3~data_sub$Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

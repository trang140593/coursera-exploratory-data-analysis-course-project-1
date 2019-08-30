# Coursera Data Science: Exploratory Data Analysis
# Course project 1: Plot2
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

## Plot 2
png(filename="/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 1/plot2.png",width = 480, height = 480)
plot(data_sub$Global_active_power~data_sub$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

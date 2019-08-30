# Coursera Data Science: Exploratory Data Analysis
# Course project 1: Plot1
# Student name: Bui Thi Thien Trang
################################################################################
rm(list = ls())
#read data following its directory
data_full=read.table('/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 1/household_power_consumption.txt',
                sep = ";",header = T)
#Convert the date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Choose data from "2007-2-1" to "2007-2-2"
data_sub <- subset(data_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

#Converting dates
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)

#Plot and save Plot1
png(filename="/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 1/plot1.png",width = 480, height = 480)
hist(as.numeric(data_sub$Global_active_power) , main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")
dev.off()


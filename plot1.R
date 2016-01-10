
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", header=TRUE, colClasses = c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","factor"), na.strings=c("?"))
unlink(temp)

mydata<-subset(data,(as.Date(Date, format="%d/%m/%Y")==as.Date("2007-02-01")| as.Date(Date, format="%d/%m/%Y")==as.Date("2007-02-02")) )
head(mydata)
png(filename = "plot1.png",    width = 480, height = 480)
with(mydata, hist(as.numeric(Global_active_power), col="red", xlab='Global Active Power (killowatts)', main="Global Active Power"))
dev.off()
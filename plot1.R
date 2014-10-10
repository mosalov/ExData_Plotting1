#Downloading a file if there is none
urlname <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename <- "data.zip"
datafilename <- "household_power_consumption.txt"
if(!file.exists(filename))
{
   download.file(url = urlname, destfile = filename)
}

#Unzipping the file
unzip(filename)
data <- read.table(file = datafilename, na.strings = c("?"), sep = ";", skip = 66637, nrows = 2880)

#Constructing a plot 1
png(filename = "plot1.png")
hist(data$V3, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
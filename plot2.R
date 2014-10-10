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
data$V10 <- strptime(paste(as.character(data$V1), as.character(data$V2)), format = "%d/%m/%Y %H:%M:%S")

#Setting the locale to english
Sys.setlocale("LC_TIME", "English")

#Constructing a plot 2
png(filename = "plot2.png")
plot(data$V10, data$V3, col = "black", type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
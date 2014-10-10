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

#Constructing a plot 3
png(filename = "plot3.png")
plot(data$V10, data$V7, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$V10, data$V8, col = "red")
lines(data$V10, data$V9, col = "blue")
legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
dev.off()
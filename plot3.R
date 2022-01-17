library(janitor)
library(lubridate)
library(dplyr)
#reading the data
data1 <- read.table('C:\\Users\\Nidhi\\Documents\\household_power_consumption.txt',header = FALSE,sep = ';')
data1 <- data1 %>% row_to_names(row_number = 1)
head(data1)

# formatting date and time in the data

data1$Date <- as.Date(data1$Date,'%d/%m/%Y')
strptime(data1$Time,'%H:%M:%S',usetz = FALSE)

# subsetting only 2 day period data
new <- subset(data1,Date >= '2007-02-01' & Date < '2007-02-03')
head(new)
hp <- as.double(new$Global_active_power)

#merging date and time
new$dateTime <- paste(new$Date,new$Time)
new$dateTime <- ymd_hms(new$dateTime)

# saving file as png
png(file = 'plot3.png')
plot(new$dateTime,new$Sub_metering_1,type = 'l',col = 'black',ylab = 'Energy Submetering',xlab = '')
lines(new$dateTime,new$Sub_metering_2,col = 'orange')
lines(new$dateTime,new$Sub_metering_3,col = 'blue')
legend(x = 'topright',lty = 'solid',col = c('black','orange','blue'),legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),cex = .8)
dev.off()

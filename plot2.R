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
#saving plot as png
png(file ='plot2.png')
plot(new$dateTime,hp,type = 'l',ylab = 'Global active power(kilowatts)',xlab='')
dev.off()

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

#saving plot to png image
png(file = 'plot1.png')
hist(hp,breaks =20,xlab = 'Global active power(kilowatts)',ylab = 'Frequency',main='Global active power',col ='red')
dev.off()

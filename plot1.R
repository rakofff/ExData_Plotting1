
'Following code creates Plot1'


'reading txt.file'

Dataset<-read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                    as.is=1:2, colClasses=c(rep("character",2),rep("numeric",7)), na.strings="?")

'creating a date-time variable'

Dataset$DateTime<- strptime(paste(Dataset$Date, Dataset$Time), "%d/%m/%Y %H:%M:%S")

'subseting dataframe'

Dataset$Date<-as.Date(Dataset$Date, format="%d/%m/%Y")
HCP<-subset(Dataset, Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")), 
            select=Global_active_power:DateTime)

'creating plot'

png("plot1.png", bg="transparent")
par(mfrow=c(1,1))
hist(HCP$Global_active_power, xlab="Global Active Power (kilowatts)", 
     col="orangered", main="Global Active Power")
dev.off()
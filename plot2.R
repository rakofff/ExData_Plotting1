'Following code creates Plot2'


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

'plot2'
png("Plot2.png", bg="transparent")
with(HCP,{
        par(mfrow=c(1,1))
        plot(DateTime, Global_active_power, 
             type="n", ylab="Global active power (kilowatts)", xlab="", lwd=1)
        lines(DateTime, Global_active_power)
})
dev.off()
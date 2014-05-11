'Following code creates Plot4'


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


png("Plot4.png", bg="transparent")

par(mfrow=c(2,2)) 

'plot1'

with(HCP,{
        plot(DateTime, Global_active_power, type="n", ylab="Global Active Power", xlab="")
        lines(DateTime, Global_active_power)
})

'plot2'

with(HCP,{
        plot(DateTime, Voltage, type="n",  xlab="datetime")
        lines(DateTime, Voltage)
})
'plot3'

with(HCP, {
        plot(DateTime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
        lines(DateTime, Sub_metering_1, col=1)
        lines(DateTime, Sub_metering_2, col=2)
        lines(DateTime, Sub_metering_3, col=4)
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               lty=c(1,1,1), lwd=c(1,1,1), col=c(1,2,4), bty="n")
} )
'plot4'

with(HCP, 
        plot(DateTime, Global_reactive_power, type="l",  xlab="datetime")
        )

dev.off()
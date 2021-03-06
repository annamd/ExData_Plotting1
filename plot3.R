#importing data
dane0<-read.table(file="household_power_consumption.txt", sep=";", header=TRUE,
                  na.strings="?",
                  colClasses=c("character", "character" , "numeric", "numeric",
                               "numeric", "numeric", "numeric"))

#converting date and time variables to appropriate format
dane0[,1]<-as.Date(dane0[,1], format="%d/%m/%Y")

#choosing only data referring to the period to be analysed
dane1<-subset(dane0, Date=="2007-02-01" | Date=="2007-02-02")
dane1$Date_time=as.character(paste(dane1$Date, dane1$Time))
dane1$dt<-strptime(dane1$Date_time, format="%Y-%m-%d %H:%M:%S")

#plot3
Sys.setlocale("LC_TIME", "English")
png(file = "plot3.png", width=480, height=480) 
plot(dane1$dt, dane1$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(dane1$dt, dane1$Sub_metering_2, type="l", xlab="",
            ylab="Energy sub metering", col="red")
lines(dane1$dt, dane1$Sub_metering_3, type="l", xlab="",
      ylab="Energy sub metering", col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

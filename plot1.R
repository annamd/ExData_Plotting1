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


#histogram of global active power
#to be saved in png file
png(file = "plot1.png", width=480, height=480) 
hist(dane1$Global_active_power, 
                xlab="Global Active Power (kilowatts)",
                main="Global Active Power",
                col="red"
     )

#saving the plot
dev.off()


## Plot 4
### Comparison charts of data in the "household electric power consumption" data set

# Produces a file plot4.png in the current R working directory

library(stringr)

print("Plot 4: Comparison Charts of household electric power consumption...")

source("https://raw.githubusercontent.com/sgillans/ExData_Plotting1/master/read_hepc_data.R")
hepc_data <- read_hepc_data()

# add a DateTime column to combine the Date & Time into a single variable for plotting
hepc_data1 <- hepc_data1 <- cbind(hepc_data,strptime(paste(hepc_data$Date,hepc_data$Time),"%d/%m/%Y %H:%M:%S"))
names(hepc_data1)[10] <- "DateTime"

output_filename <- "plot4.png"
png(output_filename)
par(mfrow=c(2,2))

# plot #1 - global active power by timestamp
plot(hepc_data1$DateTime,hepc_data1$Global_active_power,
     xlab="",
     ylab="Global Active Power (kilowatts)",
     type="n"
)
lines(hepc_data1$DateTime,hepc_data1$Global_active_power)

# plot #2 - voltage by timestamp
plot(hepc_data1$DateTime,
     hepc_data1$Voltage,
     xlab="datetime",
     ylab="Voltage",
     type="n"
)
lines(hepc_data1$DateTime,hepc_data1$Voltage,col="black")

# plot #3 - energy sub metering
plot(hepc_data1$DateTime,
     pmax(hepc_data1$Sub_metering_1,hepc_data1$Sub_metering_2,hepc_data1$Sub_metering_3),
     xlab="",
     ylab="Energy sub metering",
     type="n"
)
lines(hepc_data1$DateTime,hepc_data1$Sub_metering_1,col="black")
lines(hepc_data1$DateTime,hepc_data1$Sub_metering_2,col="red")
lines(hepc_data1$DateTime,hepc_data1$Sub_metering_3,col="blue")
legend("topright",
       names(hepc_data1)[7:9],
       col=c("black","red","blue"),
       lty=c(1,1),lwd=c(2,2), bty="n"
       )
# plot #4 - global reactive power

plot(hepc_data1$DateTime,
     hepc_data1$Global_reactive_power,
     xlab="datetime",
     ylab="Global_reactive_power",
     type="n"
)
lines(hepc_data1$DateTime,hepc_data1$Global_reactive_power,col="black")

dev.off()
print(paste("Output plot is in file: ",getwd(),.Platform$file.sep,output_filename,sep=""))
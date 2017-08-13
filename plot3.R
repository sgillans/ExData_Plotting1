## Plot 3
### Line chart of energy sub metering in the "household electric power consumption" data set

# Produces a file plot3.png in the current R working directory

library(stringr)

print("Plot 3: Chart of Energy sub metering...")

source("https://raw.githubusercontent.com/sgillans/ExData_Plotting1/master/read_hepc_data.R")
hepc_data <- read_hepc_data()

# add a DateTime column to combine the Date & Time into a single variable for plotting
hepc_data1 <- hepc_data1 <- cbind(hepc_data,strptime(paste(hepc_data$Date,hepc_data$Time),"%d/%m/%Y %H:%M:%S"))
names(hepc_data1)[10] <- "DateTime"

output_filename <- "plot3.png"
png(output_filename)
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
       lty=c(1,1),lwd=c(2,2)
       )
dev.off()
print(paste("Output plot is in file: ",getwd(),.Platform$file.sep,output_filename,sep=""))
## Plot 1
### Line chart of Global Active Power in the "household electric power consumption" data set

# Produces a file plot2.png in the current R working directory

library(stringr)

print("Plot 2: Chart of Global Active Power...")

source("https://raw.githubusercontent.com/sgillans/ExData_Plotting1/master/read_hepc_data.R")
hepc_data <- read_hepc_data()

# add a DateTime column to combine the Date & Time into a single variable for plotting
hepc_data1 <- hepc_data1 <- cbind(hepc_data,strptime(paste(hepc_data$Date,hepc_data$Time),"%d/%m/%Y %H:%M:%S"))
names(hepc_data1)[10] <- "DateTime"

output_filename <- "plot2.png"
png(output_filename)
plot(hepc_data1$DateTime,hepc_data1$Global_active_power,
     xlab="",
     ylab="Global Active Power (kilowatts)",
     type="n"
)
lines(hepc_data1$DateTime,hepc_data1$Global_active_power)
dev.off()
print(paste("Output plot is in file: ",getwd(),.Platform$file.sep,output_filename,sep=""))
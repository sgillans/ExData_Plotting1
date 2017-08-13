## Plot 1
### Histogram of Global Active Power in the "household electric power consumption" data set

# Produces a file Plot1.png in the current R working directory

library(stringr)

print("Plot 1: Histogram of Global Active Power...")

source("https://raw.githubusercontent.com/sgillans/ExData_Plotting1/master/read_hepc_data.R")
hepc_data <- read_hepc_data()
output_filename <- "plot1.png"
png(output_filename)
hist(hepc_data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)"
)
dev.off()
print(paste("Output plot is in file: ",getwd(),.Platform$file.sep,output_filename,sep=""))
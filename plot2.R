## Plot 2
### Line chart of Global Active Power in the "household electric power consumption" data set

# Produces a file plot2.png in the current R working directory

library(stringr)

## Function for reading the "Individual household electric power consumption Data Set"
## originally from the UC Irvine Machine Learning Repository
## this copy held at COURSERA Data Science course web site:
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

read_hepc_data <- function(dates_to_include = c("1/2/2007","2/2/2007")) {
    ## dates_to_include is a vector of strings containing the dates in d/m/YYYY format
    ## for which household electric power consumption (HEPC) data should be returned
    ## d = day without leading zero, m=month without leading zero
    ## this is the format in the input text file.
    
    ## function returns a dataframe with the required HEPC data
    
    require("stringr")
    
    hepc_zip_filename <- tempfile(pattern = "hepc", tmpdir = tempdir(), fileext = "")
    download.file(
        "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
        destfile=hepc_zip_filename,
        method="curl",
        quiet=TRUE
    )
    t <- read.table(unz(hepc_zip_filename,"household_power_consumption.txt"),
                    sep=";",header=TRUE,stringsAsFactors=FALSE,na.strings="?",
                    colClasses=c("character","character","numeric","numeric",
                                 "numeric","numeric","numeric","numeric","numeric"))
    rv <- c()
    for (dt in dates_to_include) {
        rv <- rbind(rv,t[str_detect(t$Date,paste("^",dt,sep="")),])
    }
    file.remove(hepc_zip_filename)
    rv
}

# Main program for Plot 2

print("Plot 2: Chart of Global Active Power...")

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
lines(hepc_data1$DateTime,hepc_data1$Global_active_power,col="black")
dev.off()
print(paste("Output plot is in file: ",getwd(),.Platform$file.sep,output_filename,sep=""))
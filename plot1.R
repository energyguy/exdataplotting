# Script to read household power consumption file & subset data for two days,then produce plots.

#Read and subset text file into daraframe.
# dates 2007-02-01 and 2007-02-02 - use as.Date() and strptime functions.
library(stringr)
library(dplyr)
library(reshape2)
library(data.table)
options(stringsAsFactors=FALSE)
#Clear environment
rm(list = ls())

#Set Working Directory
setwd("F:/coursera/")

#Set path to folder where dataset, scripts and png files are stored
dir<-"./exdataplotting1/"

#Read records for 1/2/2007 to 2/2/2007 from dataset and store in dataframe
DF<-data.frame(fread(paste(dir,"household_power_consumption.txt",sep=""),skip=66637, nrows=2880 ,header=FALSE))

#Rename columns
colnames(DF)<-c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3")

#Initialise device for plotting - (use PNG)
png(filename = paste(dir,"plot1.png",sep=""),width = 480,height=480,units = "px",bg="white")

#Plot histogram 
hist(DF$GlobalActivePower, data=DF, breaks=seq(0,7.5,by=0.5),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#close device and write output
dev.off()

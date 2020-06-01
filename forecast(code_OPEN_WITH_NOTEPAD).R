#working directory==forecast1
getwd()
#read csv file
data <- read.csv("publCSV1.csv")
#print file
print(data)
#time series
m<-ts(data$Number_of_Publications, frequency=1, start=c(1936,1))
#show time series
m
#autoregression
acf(m,lag.max=20,type="correlation")
#plot timeseries
plot(m,xlim=c(1936,2010),main="Publications per year", col.main="palegreen4",
     sub="observations up to 01/04/2020",col.sub="seagreen", xlab="Years", 
     ylab="Number of   Publications", col.lab="palegreen3", cex.lab=0.5)
#libraries for forecasting
library(fpp2)
library("forecast")
#holt method
h<-holt(m, type = c("additive"), alpha = 0.3,beta = 0.1057, lead = 0, plot = TRUE)
plot(h,type="h", xlab="Years", ylab="Number of Publications")
p2<-plot(m)
#comparison
getwd()
data1 <- read.csv("publCSV2.csv")
print(data1)
par(mfrow=c(2,1))
plot(h,type="h", xlab="Years", ylab="Number of Publications")
plot(data1, type="h", main="Publications per year",ylab="Number of Publications")
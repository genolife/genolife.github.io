library("surveillance")
data("ha.sts")
plot(ha.sts, type = observed ~ time, legend.opts = NULL, 
     main = "Hepatitis A in Berlin 2001-2006", xlab = "Time (weekly)")

ha1 <- aggregate(ha.sts, by="unit")
ha4 <- aggregate(ha.sts[, c("pank", "mitt", "frkr", "scho", "chwi", "neuk")], nfreq = 13)

plot(ha4, type = observed ~ time | unit)

library(xlsx)
library(ggplot2)

#covidData <- read.xlsx(file = "/Users/hadiwika/Data/vir/COVID-19-geographic-disbtribution-worldwide-2020-03-17.xlsx",as.data.frame = TRUE, header = TRUE, sheetIndex = 1)
#save(covidData, file = "/Users/hadiwika/Data/vir/covidData.rda")
load(file = "/Users/hadiwika/Data/vir/covidData.rda")
covidData <- covidData[-which(covidData$Countries.and.territories=="Cases_on_an_international_conveyance_Japan"),]

covidDataAggr <- aggregate(x = covidData$Cases, by = list(covidData$DateRep), FUN = sum)
colnames(covidDataAggr) <- c("DateRep", "Cases")

ggplot(data = covidDataAggr, aes(x=DateRep, y=Cases)) + geom_point()


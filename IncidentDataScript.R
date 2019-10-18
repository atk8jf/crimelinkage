library(dplyr)

##Check to see if Incidents is in Incidents2"##
check<-anti_join(Incidents, Incidents2, by='crimeID')

##Isolate categorical data from rest of Incidents2 and set NULL = 0
categoricalData<-Incidents2[,c(20:205)]
categoricalData[categoricalData=="NULL"] <- 0

#Transpose categoricalData into X^t
transposedCatData<-t(categoricalData)

#Change df to matrix
cDmatrix<- data.matrix(categoricalData, rownames.force=NA)
cDTmatrix<-data.matrix(transposedCatData, rownames.force=NA)

result<- cDTmatrix%*%cDmatrix

#//////////////////////////////////////////////
#This code was developmed by:
#Shannon E. Albeke, Ph.D.
#University of Wyoming
#Wyoming Geographic Information Science Center
#Laramie, WY 82071
#salbeke@uwyo.edu / 307-766-6207
#/////////////////////////////////////////////

#Notice the colored text, when something is green, it is commented out and not executed. 
#Thus making comments to your code easy and very useful

#Let's learn a little bit about R objects and executing code
#simple arithmetic
2+2

#store value into a varialbe, be sure to look at your workspace
a<- 2+2

#create a list of numbers. This is also called a vector of type=numeric
b<- c(10, 20, 30, 40, 50)

#this is where R leverages a lot of power and has become very popular among researchers
( ab<- a*b )

#lets convert the numeric vector to something you may be more familiar with
dfv<- data.frame(col1=ab) #vertical table, 1 col, 5 rows

#add 2 columns to the data frame using the column bind function
dfv<- cbind(dfv, col2=c(2:6), more=c(5:9))

#view the data.frame structure/data types
str(dfv)

#convert a column from numeric and add results to new column
dfv[,4]<- as.factor(dfv[,2])
str(dfv)
#push col4 back to integer and into a new column
dfv$AsInt<- as.integer(dfv[,4])
dfv$AsInt
#///////////////
#extract specific values from the 5 x 5 data frame
#row 1, col 3 USE INDEX
dfv[1,3]
#row 1, col 3 USE NAMES
names(dfv) #gives a list of column names
rownames(dfv) #gives a list of row names

dfv["1", "more"]

#once you have a data.frame with your data, you can perform all sorts of fun things, e.g.
#averages for each column of data
(colavg<- colMeans(dfv[,]) )

#first remove col4
dfv<- dfv[,-c(4)]

#NA means a NULL value, you have to be able to deal with them
dfv[1,3]<-NA

( colavg<- colMeans(dfv[,]) )

#or 
( colavg2<- sapply(dfv, FUN=function(x){mean(x, na.rm=TRUE)}) ) #average
( colsd<- sapply(dfv, FUN=function(x){sd(x, na.rm=TRUE)}) ) #standard deviation
#or
summary(dfv)

#quick barplot
barplot(colavg2)
#plot same date with confidence intervals
require(plotrix)
plotCI(colavg2, uiw=colsd, ylab="Random #", xlab="Column")

#As you can see, R can do a lot of things very quickly and easily that you have to take a little extra time to perform
#in software such as Excel, Access and ArcGIS. 

#////////////////////////////////////////////////////
#////////////////////////////////////////////////////
#Begin Analyses section

#set the working directory


#Read in the NDVI data from Ramesh ndvi

#plot the Normal data as lines


#plot second series, Dry


#ok reformat the data and run an anova to test for significant differences
#this means adding a Normal/Dry category and moving the data from columns to rows

#add the Normal data 

#make the same plot as before, just filter the data.frame


#Run the ANOVA

#Run a Linear Regression



#plot the NDVI as it relates to season, defaults to a box/whisker given season is a factor


#Now filter the data.frame to be summer time (DOY between 140 and 260)

#Re-run a linear regression

#plot the NDVI as it relates to season




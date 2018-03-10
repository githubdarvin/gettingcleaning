#Downloded the data using the URL
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
setwd("C:/SM_Projects/Personal/Training/Data Science Orientation/Data Science_Course 3/UCI HAR Dataset/Merge Data")
#Loading dplyr
#Sources are books on R and online searching on R 
library(dplyr)
library(data.table)
library(reshape2)
#reading files in R. Had all files in one folder to make it easy
activity<-read.table("activity_labels.txt")
featureNames<-read.table("feature.txt")
#Reading subject_train and subject_test
#1 Merges the training and the test sets to create one data se
subject_test<-read.table("subject_test.txt")
subject_train<-read.table("subject_train.txt")
subject_merge<-rbind(subject_test,subject_train)
#Merging Xtest and Xtrain using rbind
Xtest<-read.table("X_test.txt")
Xtrain<-read.table("X_train.txt")
Xmerge<-rbind(Xtest,Xtrain)
#Merging y_test and y_train using rbind
Ytest<-read.table("y_test.txt")
ytrain<-read.table("y_train.txt")
ymerge<-rbind(Xtest,Xtrain)
#Merging total data ensuring the column names are unique
colnames(Xmerge)[colnames(Xmerge)=="V1"] <- "V1.X"
colnames(ymerge)[colnames(ymerge)=="V1"] <- "V1.y"
totalmerge<-cbind(ymerge,subject_merge,Xmerge)
#Uses descriptive activity names to name the activities in the data set
colnames(activity)<- c("activityid","activity")
head(activity)
#2Extracts only the measurements on the mean and standard deviation for each measurement.
#Calculates the mean and standard deviation of Xmerge column 1
mean(Xmerge[,1])
sd(Xmerge[,1])
#3Uses descriptive activity names to name the activities in the data set
colnames(activity)<- c("activityid","activity")
head(activity)
colnames(ymerge)<- c("activityid")
colnames(subject_merge)<- c("subject")
totalmerge<-cbind(ymerge,subject_merge,Xmerge)
meanstd <- select(totalmerge,matches("subject|activityid|V1|mean|std"))
str(totalmerge)
#4Appropriately labels the data set with descriptive variable names.

#5From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(tidyr)
tidy_mydata <- tbl_df(totalmerge)
colnames(tidy_mydata) <- make.names(colnames(tidy_mydata) , unique=TRUE)
tidy_mydata_v2 <-group_by(tidy_mydata, subject, activityid)
View(tidy_mydata_v2)










# setwd("data")
library(dplyr)
library(plyr)
library(data.table)


# STEP 1- merge test and train
# frist create two data.frames [x,subject,y] from test and train datasets
x_test<-read.table("./UCI HAR Dataset/test/X_test.txt",sep="")
y_test<-read.table("./UCI HAR Dataset/test/Y_test.txt",sep="")
s_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",sep="")
test<- cbind(x_test,s_test,y_test)

x_train<-read.table("./UCI HAR Dataset/train/X_train.txt",sep="")
y_train<-read.table("./UCI HAR Dataset/train/Y_train.txt",sep="")
s_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",sep="")
train<- cbind(x_train,s_train,y_train)

mergedset <-rbind(test,train)

# STEP 2- Extracting only the measurements on the mean and standard deviation

# set the name of features and y and z
nam<-read.table("./UCI HAR Dataset/features.txt",sep="")
nam<- as.character(nam[,2])
features <- c(nam,"subject" ,"activity")
names(mergedset)<-features

# Finding the columns of interest and subsetting

measurements_feat<- features[c(grep("mean()", features,fixed=TRUE), grep("std()", features,fixed=TRUE))]
measurements<- mergedset[,measurements_feat]

# STEP 3- Using descriptive activity names to name the activities in the data set

activity_name<-read.table("./UCI HAR Dataset/activity_labels.txt",sep="")
for (i in activity_name[,1]) {mergedset$activity<- gsub(i,activity_name[i,2],mergedset$activity)}

# STEP 4- Appropriately labeling the data set with descriptive variable names

nam<-read.table("./UCI HAR Dataset/features.txt",sep="")
nam<- as.character(nam[,2])
features <- c(nam,"subject" ,"activity")
names(mergedset)<-features 


# STEP 5- Creating a new Tidy Data Set: 
#  Average of each variable for each activity and each subject

aggdata <- aggregate(mergedset[,1:561], by=list(mergedset[,562],mergedset[,563]), FUN=mean) 
write.table(aggdata, file = "tidy_data.txt",row.names = FALSE, col.names = TRUE)

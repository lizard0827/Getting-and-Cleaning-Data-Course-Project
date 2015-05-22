#This project data was based on the publication, "Human Activity Recognition on Smartphones 
#using a Multiclass Hardware-Friendly Support Vector Machine"
# in International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012."
# by Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.

# This script merges data from a number of .txt files and produces 
# a tidy data set which may be used for further analysis.

# check required packages
if(!require("data.table")) {
  install.package("data.table")
}

if(!require("reshape2")){
  install.package("reshape2")
}
library(reshape2)
setwd("/Users/lizard0827/Desktop/class/Getting and Cleaning data/coursera-Getting-and-Cleaning-Data/UCI HAR Dataset")
#read activity_labels
activity_labels<-read.table("activity_labels.txt")
View(activity_labels)
#read all features
features<-read.table("features.txt")
features_names<-features$V2
#read the test data and label the datafram's columns
testdata<-read.table("./test/x_test.txt")
View(testdata)
colnames(testdata)<-features_names
#read the train data and label the datafram's columns
traindata<-read.table("./train/X_train.txt")
View(traindata)
colnames(traindata)<-features_names
testsubject<-read.table("./test/subject_test.txt")
View(testsubject)
colnames(testsubject)<-"subject_ID"
testlabels<-read.table("./test/y_test.txt")
colnames(testlabels)<-"activity_ID"
trainsubject<-read.table("./train/subject_train.txt")
colnames(trainsubject)<-"subject_ID"
trainlabels<-read.table("./train/y_train.txt")
colnames(trainlabels)<-"activity_ID"
#combine test columns
test_data<-cbind(testsubject, testlabels, testdata)
#combine train columns
train_data<-cbind(trainsubject, trainlabels, traindata)
# merge the test and training sets to one data set.
alldata<-rbind(test_data, train_data)
#Extract only the measurements on the mean and standard deviation for each measurement.
mean_cols<-grep("mean", names(alldata), ignore.case=TRUE)
mean_col_names<-names(alldata[mean_cols])
std_cols<-grep("std", names(alldata), ignore.case=TRUE)
std_col_names<-names(alldata[std_cols])
data_mean_std<-alldata[,c("subject_ID", "activity_ID", mean_col_names, std_col_names)]
#Use descriptive activity names to name the activities in the data set.
#Appropriately label the data set with descriptive variable names. 
colnames(activity_labels)<-c("activity_ID", "activity_names")
decrnames<-merge(activity_labels, data_mean_std, by.x="activity_ID", by.y="activity_ID", all=TRUE)
#create a second, independent tidy data set with the average of each variable for each activity and each subject.
#melt the dataset with id variables and measure variables
melt_data<-melt(decrnames, id=c("activity_ID", "activity_names", "subject_ID"))
average_data<-dcast(melt_data, activity_ID+activity_names+subject_ID~variable, mean)
#create a tidy dataset
write.table(average_data, file="./tidy_data.txt")

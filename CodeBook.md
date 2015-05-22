#CodeBook
The codebook describes the variables, the data, and any transformations or work that I performed to clean up the data.

#Dataset
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

# Variables and performance to clean data.
1. x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
2. read data with read.table()function.
3. read activity_labels.
4. read and name variables of test and train data with features.
5. read and labels subject_ID for test and train data.
6. combine test and train data with their subject_ID, activity_ID and data using cbind()function.
7. merge the test and training data sets to one data set with rbind()function.
8. extract only the measurements on the mean and the standard deviation for each measurement using grep()function.
9. Use descriptive activity names (activity_labels) to name the activities in the data set.
10. melt the dataset with id variables and measure variables using melt()funciton.
11. use dcast()funciton to create a second, independent tidy data set with the average of each variable for each activity and each subject.
12. create a tidy_data.txt file using write.talbe()function. 

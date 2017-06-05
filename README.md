
---
### Readme
* The entire data for this project is a data collected from the accelerometer readings from a Samsung Galaxy S2 smart phone. The tidy data set is named as NewTidySet in my project. The original source of the data can be found here: http://archive.ics.uci.edu/ml/datasets/Humans+Activity+Recognition+Using+Smartphones.

* The variables and identifiers used in NewTidySet.txt are described in this code book. It summarizes the resulting data fields in NewTidySet.txt.

* There are two identifiers in this file, namely:
subject - The ID of the test subject, and 
activity - The type of activity performed when the corresponding measurements were taken.

##Description:
The features.txt file consists of all the 561 time related measurements that were collected for the study. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the 3-axial linear acceleration and 3-axial angular velocity were recorded at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

#The six different activity Labels carried out in this experiment are as follows:

* 1. WALKING : subject was walking during the test
* 2. WALKING_UPSTAIRS : subject was walking up a staircase during the test
* 3. WALKING_DOWNSTAIRS : subject was walking down a staircase during the test
* 4. SITTING : subject was sitting during the test
* 5. STANDING : subject was standing during the test
* 6. LAYING : subject was laying down during the test

##Merge the training and the test sets to create one data set.
#Set the source directory to where the files are located and read the following files into R. 

 * features.txt
 * activity_labels.txt
 * subject_train.txt
 * x_train.txt
 * y_train.txt
 * subject_test.txt
 * x_test.txt
 * y_test.txt
## The project:
* Then assign column names to the data set and merge to create one data set.
* Create a logical vector that contains TRUE values for the ID, mean and stdev columns and FALSE values for the others. Subset this data to keep only the necessary columns.
* Use descriptive activity names to name the activities in the data set
* Merge data subset with the activityType table to include the descriptive activity names
* Appropriately label the data set with descriptive activity names.
* Create a second, independent tidy data set with the average of each variable for each activity and each subject.



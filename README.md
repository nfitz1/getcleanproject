---
title: "readme"
output: html_document
---
#The Getting and Cleaning Data course project

#The "run_analysis.R" script consists of 5 major steps

##1. Merges the training and the test sets to create one data set.
##2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##3. Uses descriptive activity names to name the activities in the data set
##4. Appropriately labels the data set with descriptive variable names. 
##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

##Step 1
For step 1, the script downloads the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
After the data are extracted and saved in the working directory, the next step is to read in and bind together the following files
x_train and x_test
y_train and y_test
subject_train and subject_test
features

the x_train and test files are bound together using rbind, same for y_train and y_test, subject_train and subject_test
then the x, y, and subject data are bound together using cbind
Features provides variable labels for the x data. This is added to the x data before it is bound to the subject and y data.
The variable labels need to be cleaned up from their form in features.txt in order to be usable. the make.names function does this.

##Step 2
For step 2, dplyr can be used to select variables that contain a string in their name. After examining the variables, the actual mean and 
standard deviation files (rather than the meanFreq etc. variables which do not need to be included) include .mean. and .std. respectively. The select command results in a datafile with 68 variables -- 66 features, subject, and activity.

##Step 3
For step 3, the activities column needs to be edited to replace the numbers with their descriptive names. These are supplied in the
activity_labels file in the UCI HAR Dataset directory. 

##Step 4
For step 4, the variable labels where already unique and syntactically valid per the make.names function used in step 1.  Further changes were made to make the names more descriptive, but with an effort to balance increased descriptive value with length of variable names, which could get awkwardly long and unclear. Specifically, I made the following changes.

1. removed all "." characters
2. replaced the prefix t with "time"
3. replaced the prefix f with "freq"
4. replaced "std" with "stdev" to be somewhat more clear while not as long as "standarddeviation", 
5. changed "BodyBody" to "Body" to match the features_info file. 

I did not change capitalization because the existing capitalization helped provide some clarity in the long variable labels.


##Step 5

For step5, the goal is to create a dataset where each row gives means for a single subject doing a single activity. This means that averaging should be done over over all observations for an activity done by that subject. For example, if subject 1 did activity 1 10 times, row 1 will be mean of those 10 obs for each of the 66 features that represent means or standard deviations. Since there are 30 subjects and 6 activities, this should result in a dataset with 180 observations and 68 variables.

An efficient way of doing this involves using ddply and the numcolwise function. The numcolwise function turns a function that operates
on a vector into a function that operates column-wise on a dataframe. In this case, it calculates means for each column except for the two (subject and activity) that are specified as varaibles to split the data frame by.

In this case either the wide or narrow form of the data is tidy (see: https://class.coursera.org/getdata-009/forum/thread?thread_id=58, post 1). This file uses the wide format, indicating that an observation is a subject doing an activity, and the variables are multiple measurements of that single observation. This is similar to the example in table 12 of the tidy data paper (http://vita.had.co.nz/papers/tidy-data.pdf), where the wide format was shown to be appropriate. Therefore, each column is a variable (subject, activity, or measurement), and each row is a single observation. 




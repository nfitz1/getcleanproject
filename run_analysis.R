##Final Project

#assignment
#You should create one R script called run_analysis.R that does the following. 

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



#First download zip files into project directory and extract files
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./project/files.zip", method="auto")
## extract folders from files.zip and save the UCI HAR Dataset folder in the working directory.
##set a new working directory, the UCI HAR Dataset folder
#so the test data are in "./test", the train data are in "./train", and the features data and activity labels are in "."
#Step 1: merge training and test sets
x_train_test <- rbind(read.table("./train/X_train.txt"), read.table("./test/X_test.txt")) #merged training and test x data, order matters
#add features labels
features <- read.table("./features.txt", stringsAsFactors=FALSE) #read in features file
colnames(x_train_test) <- make.names(features[,2], unique=TRUE) #make them into syntactically valid unique names that can be bound as colnames.
#Add activity labels column to the x_train_test data 
y_train_test <- rbind(read.table("./train/y_train.txt"), read.table("./test/y_test.txt")) #merged y_train and y_test, in same order as x
colnames(y_train_test) <- "activity"
#These can now be bound to xdata2
xy_train_test <- cbind(x_train_test, y_train_test)
#add in subject IDs
subjects_train_test <- rbind(read.table("./train/subject_train.txt"), read.table("./test/subject_test.txt")) #Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
colnames(subjects_train_test) <- "subject"
step1data <- cbind(xy_train_test, subjects_train_test) #bind to xy_train_test
#step1data has all test and training data (excludes inertial signals which are not needed)

#step 2 Extract only the measurements on the mean and standard deviation for each measurement
library(dplyr) #need dplyr package, turn data into data frame tbl
step2 <- tbl_df(step1data)
#select the mean and std deviation variables, plus the activities and subjects
step2 <- step2 %>%
  select(contains(".mean."), contains(".std."), contains("activity"), contains("subject")) #based on an examination of the format of the labels list, this selects the mean and standard deviation variables for each signal, while excluding things like meanFreq, which are not actually measurements on the mean and standard deviation of each measurement.

#Step 3: name activities using the information in activity_labels.txt
step2$activity <- factor(xdata4$activity, labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))                                    
                        

#for step 4, I need to clean up variable names that have already been assigned. Look at cleaning text variables lecture from class.
labels1 <- colnames(step2) #a list of initial column names

step4 <- 

#for step 5, I want each row to be a single subject doing a single activity. Will be averaging over all observations for an activity done by that subject
#(if subject 1 did activity 1 10 times, row 1 will be mean of those 10 obs)
varmeans <- ddply(step4, .(subject, activity), numcolwise(mean)) #numcolwise within ddply applies the mean function to all columns except for the group by variables, subject and activity

#the following also works:
#library(reshape)
#x <- melt(xdata4, id=67:68, measured=1:66)
#x2 <- cast(x, subject + activity ~ variable, mean)
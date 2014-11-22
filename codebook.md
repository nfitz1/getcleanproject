---
title: "codebook"
output: html_document
---

#Codebook for the Getting and Cleaning Data Course Project

This data comes from the Human Activity Recognition Using Smartphones Data Set  (Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012). 

This codebook is adapted from the features_info.txt file provided in the download from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The original study design was described on: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Study design
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain." (Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto
Smartlab - Non Linear Complex Systems Laboratory, http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, retrieved 11/22/2014 )


##Raw data
The raw data consisted of data on 561 features for 30 subjects doing 6 activities. 
The raw data came in 6 files (plus additional intertial data files that were not used in this project):
X_train, X_test, Y_train, Y_test, subjects_train, and subjects_test.
X_train and X_test consisted of the 561 features for the training subjects (70% of volunteers) and
test subjects (30% of volunteers) respectively.
Y_train and Y_test contained vectors identifying the activity corresponding to each feature vector
for the training subjects and test subjects.
Subjects_train and Subjects_test contained vectors identifying the subject (1-30) corresponding to each feature vector, for the
training subjects and test_subjects.

"The features selected for this database come from the accelerometer
and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time
domain signals (prefix 't' to denote time) were captured at a constant
rate of 50 Hz. Then they were filtered using a median filter and a 3rd
order low pass Butterworth filter with a corner frequency of 20 Hz to
remove noise. Similarly, the acceleration signal was then separated
into body and gravity acceleration signals (tBodyAcc-XYZ and
tGravityAcc-XYZ) using another low pass Butterworth filter with a
corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional
signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to
indicate frequency domain signals).

These signals were used to estimate variables of the feature vector
for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean " (Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto
Smartlab - Non Linear Complex Systems Laboratory, "UCI HAR Dataset/features_info", downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Accessed on 11/22/2014)


##Processed data
The test and training data were merged so that the processed data include all 30 subjects in 1 table.
The subject and activity information were bound to the test and training data, such that two more columns were added:
1. Subject (range 1-30)
2. Activity, where the activity labels had been substituted for the activity numbers:
  1=WALKING
  2=WALKING_UPSTAIRS
  3=WALKING_DOWNSTAIRS
  4=SITTING
  5=STANDING
  6=LAYING

The processed data were generated only from the mean() and std() measurements from the signals,
resulting in a total of 66 measurements. Signals were renamed in the following manner:

1. removed all ".", _ and () characters 
2. replaced the prefix t with "time"
3. replaced the prefix f with "freq"
4. replaced "std" with "stdev" to be somewhat more clear while not as long as "standarddeviation", 
5. Some variables in the features vector used "BodyBody" in their name, these were changed to "Body" 
   to match the features_info file. 

The following 66 signal variables appear in the final dataset:

3 timeBodyAccmeanX
4 timeBodyAccmeanY
5	timeBodyAccmeanZ
6	timeGravityAccmeanX
7	timeGravityAccmeanY
8	timeGravityAccmeanZ
9	timeBodyAccJerkmeanX
10	timeBodyAccJerkmeanY
11	timeBodyAccJerkmeanZ
12	timeBodyGyromeanX
13	timeBodyGyromeanY
14	timeBodyGyromeanZ
15	timeBodyGyroJerkmeanX
16	timeBodyGyroJerkmeanY
17	timeBodyGyroJerkmeanZ
18	timeBodyAccMagmean
19	timeGravityAccMagmean
20	timeBodyAccJerkMagmean
21	timeBodyGyroMagmean
22	timeBodyGyroJerkMagmean
23	freqBodyAccmeanX
24	freqBodyAccmeanY
25	freqBodyAccmeanZ
26	freqBodyAccJerkmeanX
27	freqBodyAccJerkmeanY
28	freqBodyAccJerkmeanZ
29	freqBodyGyromeanX
30	freqBodyGyromeanY
31	freqBodyGyromeanZ
32	freqBodyAccMagmean
33	freqBodyAccJerkMagmean
34	freqBodyGyroMagmean
35	freqBodyGyroJerkMagmean
36	timeBodyAccstdevX
37	timeBodyAccstdevY
38	timeBodyAccstdevZ
39	timeGravityAccstdevX
40	timeGravityAccstdevY
41	timeGravityAccstdevZ
42	timeBodyAccJerkstdevX
43	timeBodyAccJerkstdevY
44	timeBodyAccJerkstdevZ
45	timeBodyGyrostdevX
46	timeBodyGyrostdevY
47	timeBodyGyrostdevZ
48	timeBodyGyroJerkstdevX
49	timeBodyGyroJerkstdevY
50	timeBodyGyroJerkstdevZ
51	timeBodyAccMagstdev
52	timeGravityAccMagstdev
53	timeBodyAccJerkMagstdev
54	timeBodyGyroMagstdev
55	timeBodyGyroJerkMagstdev
56	freqBodyAccstdevX
57	freqBodyAccstdevY
58	freqBodyAccstdevZ
59	freqBodyAccJerkstdevX
60	freqBodyAccJerkstdevY
61	freqBodyAccJerkstdevZ
62	freqBodyGyrostdevX
63	freqBodyGyrostdevY
64	freqBodyGyrostdevZ
65	freqBodyAccMagstdev
66	freqBodyAccJerkMagstdev
67	freqBodyGyroMagstdev
68	freqBodyGyroJerkMagstdev

In the raw data, for each activity (walking, standing, sitting, ...  ), multiple
measurements were taken for each of these variables  for each subject.
The values for each observation in the final data represent the average
of all measurements taken for each signal for each subject/activity combination.  To
calculate these values, the data were grouped by activity and subject,
and then a mean of each group was applied for each signal variable.
For example, the value for freqBodyGyroJerkMagstdev for row 1 (subject=1, activity=1)
is the mean value of all the calculated fBodyGryoJerkMag-sd() signal over the 48 times that
fBodyGyroJerkMag-sd() was calculated for subject 1 walking.


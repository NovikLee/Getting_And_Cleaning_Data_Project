#Getting and Cleaning Data Project Codebook

##Source Data
The data for this project was from the Human Activity Recognition Using Smartphones Data Set which tracked a group of 30 volunteers within an age bracket of 19-48 years. Each person performed activities wearing a smartphone (Samsung Galaxy S II) on the waist.
More information about this data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Data Files
The data contained the following files:

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

##Data Variables
The following were signals used to estimate variables of the feature vector for each pattern:  
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

The set of measures that were estimated from these signals are: 

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

Additional measures  obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

##R Script

The analysis script including the following steps:

1. Merging training and test data
  1.1 Download zip files and unzip
  1.2 Reading in training tables
  1.3 Reading in test tables
  1.4 Reading in features and activity lables
  1.5 Assign column names
  1.6 Merge training and test data into one
2. Extract measurements on the mean and standard deviation for each measurement
  2.1 Extract column names
  2.2 Create vector with column names containing "mean" and "std"
  2.3 Subset data with column names including mean and std
3. Use descriptive activity names to name the activity in the data set 
  3.1 Merge subset data in 2.3 with activity label table
4. Appropriate label the data set with descriptive variable names
  4.1 Replace abbreviations with descriptive labels for time, frequency, accelerator, gyroscope and magnitude
5. Create a second, independent tidy dataset with the average of each variable for each activity and each subject
  5.1 Create aggregated data by activity and subject for the mean 
  5.2 Write out final tidy data text file

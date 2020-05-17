# This is code book for data that represented in ```fullDataset.csv```
## Identifiers

* `subject` - The ID of the test subject
* `activity` - The type of activity performed when the corresponding measurements were taken

## Measurements

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

List of measurements:

- `tBodyAccMeanX`
- `tBodyAccMeanY`
- `tBodyAccMeanZ`
- `tBodyAccStdX`
- `tBodyAccStdY`
- `tBodyAccStdZ`
- `tGravityAccMeanX`
- `tGravityAccMeanY`
- `tGravityAccMeanZ`
- `tGravityAccStdX`
- `tGravityAccStdY`
- `tGravityAccStdZ`
- `tBodyAccJerkMeanX`
- `tBodyAccJerkMeanY`
- `tBodyAccJerkMeanZ`
- `tBodyAccJerkStdX`
- `tBodyAccJerkStdY`
- `tBodyAccJerkStdZ`
- `tBodyGyroMeanX`
- `tBodyGyroMeanY`
- `tBodyGyroMeanZ`
- `tBodyGyroStdX`
- `tBodyGyroStdY`
- `tBodyGyroStdZ`
- `tBodyGyroJerkMeanX`
- `tBodyGyroJerkMeanY`
- `tBodyGyroJerkMeanZ`
- `tBodyGyroJerkStdX`
- `tBodyGyroJerkStdY`
- `tBodyGyroJerkStdZ`
- `tBodyAccMagMean`
- `tBodyAccMagStd`
- `tGravityAccMagMean`
- `tGravityAccMagStd`
- `tBodyAccJerkMagMean`
- `tBodyAccJerkMagStd`
- `tBodyGyroMagMean`
- `tBodyGyroMagStd`
- `tBodyGyroJerkMagMean`
- `tBodyGyroJerkMagStd`
- `fBodyAccMeanX`
- `fBodyAccMeanY`
- `fBodyAccMeanZ`
- `fBodyAccStdX`
- `fBodyAccStdY`
- `fBodyAccStdZ`
- `fBodyAccMeanFreqX`
- `fBodyAccMeanFreqY`
- `fBodyAccMeanFreqZ`
- `fBodyAccJerkMeanX`
- `fBodyAccJerkMeanY`
- `fBodyAccJerkMeanZ`
- `fBodyAccJerkStdX`
- `fBodyAccJerkStdY`
- `fBodyAccJerkStdZ`
- `fBodyAccJerkMeanFreqX`
- `fBodyAccJerkMeanFreqY`
- `fBodyAccJerkMeanFreqZ`
- `fBodyGyroMeanX`
- `fBodyGyroMeanY`
- `fBodyGyroMeanZ`
- `fBodyGyroStdX`
- `fBodyGyroStdY`
- `fBodyGyroStdZ`
- `fBodyGyroMeanFreqX`
- `fBodyGyroMeanFreqY`
- `fBodyGyroMeanFreqZ`
- `fBodyAccMagMean`
- `fBodyAccMagStd`
- `fBodyAccMagMeanFreq`
- `fBodyBodyAccJerkMagMean`
- `fBodyBodyAccJerkMagStd`
- `fBodyBodyAccJerkMagMeanFreq`
- `fBodyBodyGyroMagMean`
- `fBodyBodyGyroMagStd`
- `fBodyBodyGyroMagMeanFreq`
- `fBodyBodyGyroJerkMagMean`
- `fBodyBodyGyroJerkMagStd`
- `fBodyBodyGyroJerkMagMeanFreq`
  
**Total - 79**

## Activity types

- `WALKING` (value `1`)
- `WALKING_UPSTAIRS` (value `2`)
- `WALKING_DOWNSTAIRS` (value `3`)
- `SITTING` (value `4`)
- `STANDING` (value `5`)
- `LAYING` (value `6`)

## File "fullDatasetMean.csv"
Code book for this file is basically same, but each column (measurement) is average (mean) value of each variable for each subject and activity pair from fullDataset.csv
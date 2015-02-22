# Getting and Cleaning Data Project Code Book

## Data Source
The original data source is derived from experiments that were carried out with a group of 30 volunteers within an age bracket of 19-48 years.  Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smart phone (Samsung Galaxy S II) on their waist.  Using its embedded accelerometer and gyroscope, the scientists captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  The experiments have been video-recorded to label the data manually.  The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training set and 30% were assigned as test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).  The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity.  The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3Hz cutoff frequency was used.  From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

* [The Complete Original Data Source and Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)
* [Data file used while testing](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Tidy Data Set
To create the tidy data set required for the course project, several steps were programmatically executed by the run_analysis.R script. The following 5 steps were completed:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Tidy Dataset Features
| Feature | Description |
| ------- | ----------- |
| activityId | This contains the descriptive name for the activity performed. This can be any one of the following values: Walking, Walking upstairs, Walking downstairs, Sitting, Standing, Laying |
| subjectId | This feature identifies the subject who performed the activity for each sample.  The range is from 1 to 30 |
| timeBodyAccMagnitudeMean | The mean of the time domain signals for the magnitude of the three-dimensional body acceleration signals from the accelerometer calculated using the Euclidean norm. |
| timeBodyAccMagnitudeStdDev | The standard deviation of the time domain signals for the magnitude of the three-dimensional body acceleration signals from the accelerometer calculated using the Euclidean norm. |
| timeGravityAccMagnitudeMean | The mean of the time domain signals for the magnitude of the three-dimensional gravity acceleration signals from the accelerometer calculated using the Euclidean norm. |
| timeGravityAccMagnitudeStdDev | The standard deviation of the time domain signals for the magnitude of the three-dimensional gravity acceleration signals from the accelerometer calculated using the Euclidean norm.|
| timeBodyAccJerkMagnitudeMean | The mean of the time domain signals for the magnitude of the three-dimensional Jerk signals from the accelerometer calculated using the Euclidean norm.|
| timeBodyAccJerkMagnitudeStdDev | The standard deviation of the time domain signals for the magnitude of the three-dimensional Jerk signals from the accelerometer calculated using the Euclidean norm.|
| timeBodyGyroMagnitudeMean | The mean of the time domain signals for the magnitude of the three-dimensional body acceleration signals from the gyroscope calculated using the Euclidean norm.|
| timeBodyGyroMagnitudeStdDev | The standard deviation of the time domain signals for the magnitude of the three-dimensional body acceleration signals from the gyroscope calculated using the Euclidean norm. |
| timeBodyGyroJerkMagnitudeMean | The mean of the time domain signals for the magnitude of the three-dimensional jerk signals from the gyroscope calculated using the Euclidean norm.|
| timeBodyGyroJerkMagnitudeStdDev | The standard deviation of the time domain signals for the magnitude of the three-dimensional jerk signals from the gyroscope calculated using the Euclidean norm.|
| freqBodyAccMagnitudeMean | The mean of the frequency domain signals for the magnitude of the three-dimensional body acceleration signals from the accelerometer calculated using a Fast Fourier Transform and the Euclidean norm. |
| freqBodyAccMagnitudeStdDev | The standard deviation of the frequency domain signals for the magnitude of the three-dimensional body acceleration signals from the accelerometer calculated using a Fast Fourier Transform and the Euclidean norm.|
| freqBodyAccJerkMagnitudeMean | The mean of the frequency domain signals for the magnitude of the three-dimensional jerk signals from the accelerometer calculated using a Fast Fourier Transform and the Euclidean norm.|
| freqBodyAccJerkMagnitudeStdDev | The standard deviation of the frequency domain signals for the magnitude of the three-dimensional jerk signals from the accelerometer calculated using a Fast Fourier Transform and the Euclidean norm.|
| freqBodyGyroMagnitudeMean | The mean of the frequency domain signals for the magnitude of the three-dimensional body acceleration signals from the gyroscope calculated using a Fast Fourier Transform and the Euclidean norm.|
| freqBodyGyroMagnitudeStdDev | The standard deviation of the frequency domain signals for the magnitude of the three-dimensional body acceleration signals from the gyroscope calculated using a Fast Fourier Transform and the Euclidean norm. |
| freqBodyGyroJerkMagnitudeMean | The mean of the frequency domain signals for the magnitude of the three-dimensional jerk signals from the gyroscope calculated using a Fast Fourier Transform and the Euclidean norm.|
| freqBodyGyroJerkMagnitudeStdDev | The standard deviation of the frequency domain signals for the magnitude of the three-dimensional jerk signals from the gyroscope calculated using a Fast Fourier Transform and the Euclidean norm.|
---
title: "CodeBook"
author: "K Knecht"
date: "30/03/2021"
output: html_document
---


### Human Activity Recognition Using Smartphones Dataset
The computed data set constitutes a cleaned subset of the Human Activity Recognition Using Smartphones Dataset (UCI HAR) [1].

This data set was derived by [1] as follows:

*The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.* 

*The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.* [1]

The original data set provides for each record:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


#### Cleaning Process
To clean up and subset the data set, the following transformations were performed:

- The partition into training and test data sets has been reversed and the two sets for subjects, features (X), and activities (Y) were merged separately first and then joined together to create one data set. Before joining the individual data frames for subjects, features and activities, the variables were renamed according to the feature list to remove duplicate, non-descriptive column names.

- From the data set only the measurements on the mean and standard deviation for each feature were selected, which reduced the 561-feature vector to 66 features (see Description of Features and List of Variables below for details).

- Activity values were substituted by descriptive activity names based on the activity labels provided (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

- Variable names were cleaned up by removing unnecessary characters, such as '-' and '()', by substituting abbreviations as well as ensuring upper/lower case consistency. 

- The  data set was then grouped by subjects and activities providing the average for each variable based on the grouping.

The tidy UCI HAR data set provides the average of 66 time and frequency domain variables for each activity recorded for each subject.


### Description of Features
The following information on features was provided by [1]. Variable names have been updated to match the variable names in the tidied data set:

*The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeDomainSignalAccelerometer-XYZ and timeDomainSignalGyroscope-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeDomainSignalBodyAccelerometer-XYZ and timeDomainSignalGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. *

*Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeDomainSignalBodyAccelerometerJerk-XYZ and timeDomainSignalBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeDomainSignalBodyAccelerometerMagnitude, timeDomainSignalGravityAccelerometerMagnitude, timeDomainSignalBodyAccelerometerJerkMagnitude, timeDomainSignalBodyGyroscopeMagnitude, timeDomainSignalBodyGyroscopeJerkMagnitude). *

*Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyDomainSignalBodyAccelerometer-XYZ, frequencyDomainSignalBodyAccelerometerJerk-XYZ, frequencyDomainSignalBodyGyroscope-XYZ, frequencyDomainSignalBodyAccelerometerJerkMagnitude, frequencyDomainSignalBodyGyroscopeMagnitude, frequencyDomainSignalBodyGyroscopeJerkMagnitude. *

*These signals were used to estimate variables of the feature vector for each pattern:*
*'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.*

From the original set of variables that were estimated from these signals only the mean value and standard deviation were included in the present data set.

#### Note:
For the description of the original data set features and variables, please see './data/UCI HAR Dataset/features_info.txt'. The complete list of original variables of each feature vector is available in './data/UCI HAR Dataset/features.txt'


### List of Variables

The tidy data set contains the following variables, which can be distinguished into variables that were used for grouping and the variables derived from the feature vector.

#### Grouping Variables:

- **subject**: subject ID, 1 to 30

- **activity**: activity type, 6 labels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
 
#### Feature Variables:

- **timeDomainSignalBodyAccelerometerMeanX**: Mean of raw body acceleration signals in X direction.
- **timeDomainSignalBodyAccelerometerMeanY**: Mean of raw body acceleration signals in Y direction.
- **timeDomainSignalBodyAccelerometerMeanZ**: Mean of raw body acceleration signals in Z direction.
- **timeDomainSignalBodyAccelerometerStandardDeviationX**: Standard deviation of raw body acceleration signals in X direction.
- **timeDomainSignalBodyAccelerometerStandardDeviationY**: Standard deviation of raw body acceleration signals in Y direction.
- **timeDomainSignalBodyAccelerometerStandardDeviationZ**: Standard deviation of raw body acceleration signals in Z direction.
- **timeDomainSignalGravityAccelerometerMeanX**: Mean of raw gravity acceleration signals in X direction.
- **timeDomainSignalGravityAccelerometerMeanY**: Mean of raw gravity acceleration signals in Y direction.
- **timeDomainSignalGravityAccelerometerMeanZ**: Mean of raw gravity acceleration signals in Z direction.
- **timeDomainSignalGravityAccelerometerStandardDeviationX**: Standard deviation of raw gravity acceleration signals in X direction.
- **timeDomainSignalGravityAccelerometerStandardDeviationY**: Standard deviation of raw gravity acceleration signals in Y direction
- **timeDomainSignalGravityAccelerometerStandardDeviationZ**: Standard deviation of raw gravity acceleration signals in Z direction
- **timeDomainSignalBodyAccelerometerJerkMeanX**: Mean of raw body acceleration jerk signals in X direction.
- **timeDomainSignalBodyAccelerometerJerkMeanY**: Mean of raw body acceleration jerk signals in Y direction.
- **timeDomainSignalBodyAccelerometerJerkMeanZ**: Mean of raw body acceleration jerk signals in Z direction.
- **timeDomainSignalBodyAccelerometerJerkStandardDeviationX**: Standard deviation of raw body acceleration jerk signals in X direction.
- **timeDomainSignalBodyAccelerometerJerkStandardDeviationY**: Standard deviation of raw body acceleration jerk signals in Y direction.
- **timeDomainSignalBodyAccelerometerJerkStandardDeviationZ**: Standard deviation of raw body acceleration jerk signals in Z direction.
- **timeDomainSignalBodyGyroscopeMeanX**: Mean of raw body gyroscope signals in X direction.
- **timeDomainSignalBodyGyroscopeMeanY**: Mean of raw body gyroscope signals in Y direction.
- **timeDomainSignalBodyGyroscopeMeanZ**: Mean of raw body gyroscope signals in Z direction.
- **timeDomainSignalBodyGyroscopeStandardDeviationX**: Standard deviation of raw body gyroscope signals in X direction.
- **timeDomainSignalBodyGyroscopeStandardDeviationY**: Standard deviation of raw body gyroscope signals in Y direction.
- **timeDomainSignalBodyGyroscopeStandardDeviationZ**: Standard deviation of raw body gyroscope signals in Z direction.
- **timeDomainSignalBodyGyroscopeJerkMeanX**: Mean of raw body gyroscope jerk signals in X direction.
- **timeDomainSignalBodyGyroscopeJerkMeanY**: Mean of raw body gyroscope jerk signals in Y direction.
- **timeDomainSignalBodyGyroscopeJerkMeanZ**: Mean of raw body gyroscope jerk signals in Z direction.
- **timeDomainSignalBodyGyroscopeJerkStandardDeviationX**: Standard deviation of raw body gyroscope jerk signals in X direction.
- **timeDomainSignalBodyGyroscopeJerkStandardDeviationY**: Standard deviation of raw body gyroscope jerk signals in Y direction.
- **timeDomainSignalBodyGyroscopeJerkStandardDeviationZ**: Standard deviation of raw body gyroscope jerk signals in Z direction.
- **timeDomainSignalBodyAccelerometerMagnitudeMean**: Mean of magnitude of raw body acceleration signals.
- **timeDomainSignalBodyAccelerometerMagnitudeStandardDeviation**: Standard deviation of magnitude of raw body acceleration signals.
- **timeDomainSignalGravityAccelerometerMagnitudeMean**: Mean of magnitude of raw gravity acceleration signals.
- **timeDomainSignalGravityAccelerometerMagnitudeStandardDeviation**: Standard deviation of magnitude of raw gravity acceleration signals.
- **timeDomainSignalBodyAccelerometerJerkMagnitudeMean**: Mean of magnitude of raw body acceleration jerk signals.
- **timeDomainSignalBodyAccelerometerJerkMagnitudeStandardDeviation**: Standard deviation of magnitude of raw body acceleration jerk signals.
- **timeDomainSignalBodyGyroscopeMagnitudeMean**: Mean of magnitude of raw body gyroscope signals.
- **timeDomainSignalBodyGyroscopeMagnitudeStandardDeviation**: Standard deviation of magnitude of raw body gyroscope signals.
- **timeDomainSignalBodyGyroscopeJerkMagnitudeMean**: Mean of magnitude of raw body gyroscope jerk signals.
- **timeDomainSignalBodyGyroscopeJerkMagnitudeStandardDeviation**: Standard deviation of magnitude of raw body gyroscope jerk signals.

- **frequencyDomainSignalBodyAccelerometerMeanX**: Mean of frequency domain body acceleration signals in X direction.
- **frequencyDomainSignalBodyAccelerometerMeanY**: Mean of frequency domain body acceleration signals in Y direction.
- **frequencyDomainSignalBodyAccelerometerMeanZ**: Mean of frequency domain body acceleration signals in Z direction.
- **frequencyDomainSignalBodyAccelerometerStandardDeviationX**: Standard deviation of frequency domain body acceleration signals in X direction.
- **frequencyDomainSignalBodyAccelerometerStandardDeviationY**: Standard deviation of frequency domain body acceleration signals in Y direction.
- **frequencyDomainSignalBodyAccelerometerStandardDeviationZ**: Standard deviation of frequency domain body acceleration signals in Z direction. 
- **frequencyDomainSignalBodyAccelerometerJerkMeanX**: Mean of frequency domain body acceleration jerk signals in X direction.
- **frequencyDomainSignalBodyAccelerometerJerkMeanY**: Mean of frequency domain body acceleration jerk signals in Y direction.
- **frequencyDomainSignalBodyAccelerometerJerkMeanZ**: Mean of frequency domain body acceleration jerk signals in Z direction.
- **frequencyDomainSignalBodyAccelerometerJerkStandardDeviationX**: Standard deviation of frequency domain body acceleration jerk signals in X direction.
- **frequencyDomainSignalBodyAccelerometerJerkStandardDeviationY**: Standard deviation of frequency domain body acceleration jerk signals in Y direction.
- **frequencyDomainSignalBodyAccelerometerJerkStandardDeviationZ**: Standard deviation of frequency domain body acceleration jerk signals in Z direction.
- **frequencyDomainSignalBodyGyroscopeMeanX**: Mean of frequency domain body gyroscope signals in X direction.
- **frequencyDomainSignalBodyGyroscopeMeanY**: Mean of frequency domain body gyroscope signals in Y direction.
- **frequencyDomainSignalBodyGyroscopeMeanZ**: Mean of frequency domain body gyroscope signals in Z direction.
- **frequencyDomainSignalBodyGyroscopeStandardDeviationX**: Standard deviation of frequency domain body gyroscope signals in X direction.
- **frequencyDomainSignalBodyGyroscopeStandardDeviationY**: Standard deviation of frequency domain body gyroscope signals in Y direction.
- **frequencyDomainSignalBodyGyroscopeStandardDeviationZ**: Standard deviation of frequency domain body gyroscope signals in Z direction.
- **frequencyDomainSignalBodyAccelerometerMagnitudeMean**: Mean of magnitude of frequency domain body acceleration signals.
- **frequencyDomainSignalBodyAccelerometerMagnitudeStandardDeviation**: Standard deviation of magnitude of frequency domain body acceleration signals.
- **frequencyDomainSignalBodyBodyAccelerometerJerkMagnitudeMean**: Mean of magnitude of frequency domain body acceleration jerk signals.
- **frequencyDomainSignalBodyBodyAccelerometerJerkMagnitudeStandardDeviation**: Standard deviation of magnitude of frequency domain body acceleration jerk signals.
- **frequencyDomainSignalBodyBodyGyroscopeMagnitudeMean**: Mean of magnitude of frequency domain body gyroscope signals.
- **frequencyDomainSignalBodyBodyGyroscopeMagnitudeStandardDeviation**: Standard deviation of magnitude of frequency domain body gyroscope signals.
- **frequencyDomainSignalBodyBodyGyroscopeJerkMagnitudeMean**: Mean of magnitude of frequency domain body gyroscope jerk signals.
- **frequencyDomainSignalBodyBodyGyroscopeJerkMagnitudeStandardDeviation**: Standard deviation of magnitude of frequency domain body gyroscope jerk signals.



### Reference:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

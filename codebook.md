# Codebook for Final project: Getting and Cleaning Data class
### Author: Don Baldwin
### Date: 6/7/2016

### To view this file, open in RStudio and press the "Preview HTML" button"

### Added columns 

Column Name  | Purpose                                              | Values
-------------|------------------------------------------------------|---------------------------
subjectdata  | identifies the subject, a person                     | 1 to 30
activitydata | identifies specific activities tracked by the device | e.g., WALKING, STANDING
dataset      | data source                                          | Test, Training

### Summarized columns (mean of column for subject & activity combination (means and standard deviations))

Column Name                             | Purpose                                       | Units
----------------------------------------|-----------------------------------------------|-----------
angle(tBodyAccJerkMean),gravityMean)    | Angle between tBodyAccJerkMean and gravityMean| Radians
angle(tBodyAccMean,gravity)             | Angle between tBodyAccMean and gravity        | Radians
angle(tBodyGyroJerkMean,gravityMean)    | Angle between tBodyGyroJerkMean&gravityMean   | Radians
angle(tBodyGyroMean,gravityMean)        | Angle between tBodyGyroMean,gravityMean       | Radians
angle(X,gravityMean)                    | Angle between X and gravityMean               | Radians
angle(Y,gravityMean)                    | Angle between Y and gravityMean               | Radians
angle(Z,gravityMean)                    | Angle between Z and gravityMean               | Radians
                                        |                                               |
fBodyAcc-mean()-X                       | X mean acceleration -gravity subtracted       | standard gravity 'g' 
fBodyAcc-mean()-Y                       | Y mean acceleration -gravity                  | standard gravity 'g'
fBodyAcc-mean()-Z                       | Z mean acceleration -gravity                  | standard gravity 'g'
fBodyAcc-meanFreq()-X                   | X mean freq acceleration -gravity             | standard gravity 'g'
fBodyAcc-meanFreq()-Y                   | Y mean freq acceleration -gravity             | standard gravity 'g'
fBodyAcc-meanFreq()-Z                   | Z mean acceleration -gravity                  | standard gravity 'g'
fBodyAcc-std()-X                        | X stddev acceleration -gravity                | standard gravity 'g'
fBodyAcc-std()-Y                        | Y stddev acceleration -gravity                | standard gravity 'g'
fBodyAcc-std()-Z                        | Z stddev acceleration -gravity                | standard gravity 'g'
                                        |                                               |
fBodyAccJerk-mean()-X                   | X jerk - minus gravity                        | standard gravity 'g'
fBodyAccJerk-mean()-Y                   | Y jerk - minus gravity                        | standard gravity 'g'
fBodyAccJerk-mean()-Z                   | Z jerk - minus gravity                        | standard gravity 'g'
fBodyAccJerk-meanFreq()-X               | X jerk - minus gravity                        | standard gravity 'g'
fBodyAccJerk-meanFreq()-Y               | Y jerk - minus gravity                        | standard gravity 'g'
fBodyAccJerk-meanFreq()-Z               | Z jerk - minus gravity                        | standard gravity 'g'
fBodyAccJerk-std()-X                    | X jerk - minus gravity                        | standard gravity 'g'
fBodyAccJerk-std()-Y                    | Y jerk - minus gravity                        | standard gravity 'g'
fBodyAccJerk-std()-Z                    | Z jerk - minus gravity                        | standard gravity 'g'
fBodyAccMag-mean()                      |                                               | standard gravity 'g'
fBodyAccMag-meanFreq()                  |                                               | standard gravity 'g'
fBodyAccMag-std()                       |                                               | standard gravity 'g'
fBodyBodyAccJerkMag-mean()              |                                               | standard gravity 'g'
fBodyBodyAccJerkMag-meanFreq()          |                                               | standard gravity 'g'
fBodyBodyAccJerkMag-std()               |                                               |
                                        |                                               |
fBodyBodyGyroJerkMag-mean()             |                                               | radians/second
fBodyBodyGyroJerkMag-meanFreq()         |                                               | radians/second
fBodyBodyGyroJerkMag-std()              |                                               | radians/second
fBodyBodyGyroMag-mean()                 |                                               | radians/second
fBodyBodyGyroMag-meanFreq()             |                                               | radians/second
fBodyBodyGyroMag-std()                  |                                               | radians/second
fBodyGyro-mean()-X                      |                                               | radians/second
fBodyGyro-mean()-Y                      |                                               | radians/second
fBodyGyro-mean()-Z                      |                                               | radians/second
fBodyGyro-meanFreq()-X                  |                                               | radians/second
fBodyGyro-meanFreq()-Y                  |                                               | radians/second
fBodyGyro-meanFreq()-Z                  |                                               | radians/second
fBodyGyro-std()-X                       |                                               | radians/second
fBodyGyro-std()-Y                       |                                               | radians/second
fBodyGyro-std()-Z                       |                                               | radians/second
                                        |                                               |
tBodyAcc-mean()-X                       | X mean acceleration gravity INCLUDED          | standard gravity 'g'
tBodyAcc-mean()-Y                       | Y mean acceleration gravity INCLUDED          | standard gravity 'g'
tBodyAcc-mean()-Z                       | Z mean acceleration gravity INCLUDED          | standard gravity 'g'
tBodyAcc-std()-X                        | X stddev acceleration gravity INCLUDED        | standard gravity 'g' 
tBodyAcc-std()-Y                        | Y stddev acceleration gravity INCLUDED        | standard gravity 'g'
tBodyAcc-std()-Z                        | Z stddev acceleration gravity INCLUDED        | standard gravity 'g'
tBodyAccJerk-mean()-X                   |                                               | standard gravity 'g'
tBodyAccJerk-mean()-Y                   |                                               | standard gravity 'g'
tBodyAccJerk-mean()-Z                   |                                               | standard gravity 'g'
tBodyAccJerk-std()-X                    |                                               | standard gravity 'g'
tBodyAccJerk-std()-Y                    |                                               | standard gravity 'g'
tBodyAccJerk-std()-Z                    |                                               | standard gravity 'g'
tBodyAccJerkMag-mean()                  |                                               | standard gravity 'g'
tBodyAccJerkMag-std()                   |                                               | standard gravity 'g'
tBodyAccMag-mean()                      |                                               | standard gravity 'g'
tBodyAccMag-std()                       |                                               | standard gravity 'g'
                                        |                                               |
tBodyGyro-mean()-X                      |                                               | radians/second
tBodyGyro-mean()-Y                      |                                               | radians/second
tBodyGyro-mean()-Z                      |                                               | radians/second
tBodyGyro-std()-X                       |                                               | radians/second
tBodyGyro-std()-Y                       |                                               | radians/second
tBodyGyro-std()-Z                       |                                               | radians/second
tBodyGyroJerk-mean()-X                  |                                               | radians/second
tBodyGyroJerk-mean()-Y                  |                                               | radians/second
tBodyGyroJerk-mean()-Z                  |                                               | radians/second
tBodyGyroJerk-std()-X                   |                                               | radians/second
tBodyGyroJerk-std()-Y                   |                                               | radians/second
tBodyGyroJerk-std()-Z                   |                                               | radians/second
tBodyGyroJerkMag-mean()                 |                                               | radians/second
tBodyGyroJerkMag-std()                  |                                               | radians/second
tBodyGyroMag-mean()                     |                                               | radians/second
tBodyGyroMag-std()                      |                                               | radians/second
                                        |                                               |
tGravityAcc-mean()-X                    |                                               | standard gravity 'g'
tGravityAcc-mean()-Y                    |                                               | standard gravity 'g'
tGravityAcc-mean()-Z                    |                                               | standard gravity 'g'
tGravityAcc-std()-X                     |                                               | standard gravity 'g'
tGravityAcc-std()-Y                     |                                               | standard gravity 'g'
tGravityAcc-std()-Z                     |                                               | standard gravity 'g'
tGravityAccMag-mean()                   |                                               | standard gravity 'g'
tGravityAccMag-std()                    |                                               | standard gravity 'g'


Feature Selection (from project files provided by Coursera)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

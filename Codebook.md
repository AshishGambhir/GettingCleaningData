# GettingCleaningData


# CODE BOOK: Getting and Cleaning Data - Course Project


## Input Data Variables

### Training and Test Features Variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


````
* VARIABLE_NAME		UNITS
* tBodyAcc-XYZ		Hz
* tGravityAcc-XYZ	Hz
* tBodyAccJerk-XYZ	Hz
* tBodyGyro-XYZ		Hz
* tBodyGyroJerk-XYZ	Hz
* tBodyAccMag		Hz
* tGravityAccMag	Hz
* tBodyAccJerkMag	Hz
* tBodyGyroMag		Hz
* tBodyGyroJerkMag	Hz
* fBodyAcc-XYZ		Hz
* fBodyAccJerk-XYZ	Hz
* fBodyGyro-XYZ		Hz
* fBodyAccMag		Hz
* fBodyAccJerkMag	Hz
* fBodyGyroMag		Hz
* fBodyGyroJerkMag	Hz
````

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
gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean 

### Training and Test Labels Data
````
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING
````


## Transformation


* STEP-1: Set-up Step
	+ Load necessary R packages
	+ Set-up step to define access variables for input/output directory and files
	

* STEP-2: Read all Input files
	+ Read Features and Activity info
	+ Read Training Features and Label Data 
	+ Read Test Features and Label Data

  
* STEP-3: Implement Part#1 of Course Assignment
	+ Merge the training and the test sets to create one data set to create X_joindata, Y_joindata and subject_joindata.


* STEP-4: Implement Part#2 of Course Assignment
	+ Extract only the measurements on the mean and standard deviation for each measurement using grep() to create X_subsetdata       

  
* STEP-5: Implement Part#3 of Course Assignment
  	+ Uses descriptive activity names to name the activities in the data set
	+ New column added to Y_joindata called "ActivityDescription"
  
* STEP-6: Implement Part#4 of Course Assignment
	+ Appropriately labels the data set with descriptive variable names
	+ In features dataset X_subsetdata, Replace t with Time, f with FFT, mean() with _MeanValue, std() with StandardDeviation and -XYZ with _XYZ
	
* STEP-7: Implement Part#5 of Course Assignment
    + From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
	+ mergeddata created using subject data, label data and features data
	+ tdata (tidydata) dataset created where mean value for each subject and activity calculated
	+ Output file with the tidydataset is written


## Tidy Data

### Tidy Data Output Variables
````
*	VARIABLE_NAME								UNITS
*	Subject                                  	Integer    [1..30]
*	Activity                                 	Integer    [1..6]
*	Time_BodyAcc_MeanValue_X                  	Hz   [0-50]
*	Time_BodyAcc_MeanValue_Z                  	Hz   [0-50]
*	Time_BodyAcc_StandardDeviation_Y          	Hz   [0-50]
*	Time_GravityAcc_MeanValue_X               	Hz   [0-50]
*	Time_GravityAcc_MeanValue_Z               	Hz   [0-50]
*	Time_GravityAcc_StandardDeviation_Y       	Hz   [0-50]
*	Time_BodyAccJerk_MeanValue_X              	Hz   [0-50]
*	Time_BodyAccJerk_MeanValue_Z              	Hz   [0-50]
*	Time_BodyAccJerk_StandardDeviation_Y      	Hz   [0-50]
*	Time_BodyGyro_MeanValue_X                 	Hz   [0-50]
*	Time_BodyGyro_MeanValue_Z                 	Hz   [0-50]
*	Time_BodyGyro_StandardDeviation_Y         	Hz   [0-50]
*	Time_BodyGyroJerk_MeanValue_X             	Hz   [0-50]
*	Time_BodyGyroJerk_MeanValue_Z             	Hz   [0-50]
*	Time_BodyGyroJerk_StandardDeviation_Y     	Hz   [0-50]
*	Time_BodyAccMag_MeanValue                 	Hz   [0-50]
*	Time_GravityAccMag_MeanValue              	Hz   [0-50]
*	Time_BodyAccJerkMag_MeanValue             	Hz   [0-50]
*	Time_BodyGyroMag_MeanValue                	Hz   [0-50]
*	Time_BodyGyroJerkMag_MeanValue            	Hz   [0-50]
*	FFT_BodyAcc_MeanValue_X                   	Hz   [0-50]
*	FFT_BodyAcc_MeanValue_Z                   	Hz   [0-50]
*	FFT_BodyAcc_StandardDeviation_Y           	Hz   [0-50]
*	FFT_BodyAccJerk_MeanValue_X               	Hz   [0-50]
*	FFT_BodyAccJerk_MeanValue_Z               	Hz   [0-50]
*	FFT_BodyAccJerk_StandardDeviation_Y       	Hz   [0-50]
*	FFT_BodyGyro_MeanValue_X                  	Hz   [0-50]
*	FFT_BodyGyro_MeanValue_Z                  	Hz   [0-50]
*	FFT_BodyGyro_StandardDeviation_Y          	Hz   [0-50]
*	FFT_BodyAccMag_MeanValue                  	Hz   [0-50]
*	FFT_BodyBodyAccJerkMag_MeanValue          	Hz   [0-50]
*	FFT_BodyBodyGyroMag_MeanValue             	Hz   [0-50]
*	FFT_BodyBodyGyroJerkMag_MeanValue       	Hz   [0-50]
*	Time_BodyAcc_MeanValue_Y                   	Hz   [0-50]
*	Time_BodyAcc_StandardDeviation_X         	Hz   [0-50]
*	Time_BodyAcc_StandardDeviation_Z         	Hz   [0-50]
*	Time_GravityAcc_MeanValue_Y              	Hz   [0-50]
*	Time_GravityAcc_StandardDeviation_X      	Hz   [0-50]
*	Time_GravityAcc_StandardDeviation_Z      	Hz   [0-50]
*	Time_BodyAccJerk_MeanValue_Y             	Hz   [0-50]
*	Time_BodyAccJerk_StandardDeviation_X     	Hz   [0-50]
*	Time_BodyAccJerk_StandardDeviation_Z     	Hz   [0-50]
*	Time_BodyGyro_MeanValue_Y                	Hz   [0-50]
*	Time_BodyGyro_StandardDeviation_X        	Hz   [0-50]
*	Time_BodyGyro_StandardDeviation_Z        	Hz   [0-50]
*	Time_BodyGyroJerk_MeanValue_Y            	Hz   [0-50]
*	Time_BodyGyroJerk_StandardDeviation_X    	Hz   [0-50]
*	Time_BodyGyroJerk_StandardDeviation_Z    	Hz   [0-50]
*	Time_BodyAccMag_StandardDeviation        	Hz   [0-50]
*	Time_GravityAccMag_StandardDeviation     	Hz   [0-50]
*	Time_BodyAccJerkMag_StandardDeviation    	Hz   [0-50]
*	Time_BodyGyroMag_StandardDeviation       	Hz   [0-50]
*	Time_BodyGyroJerkMag_StandardDeviation   	Hz   [0-50]
*	FFT_BodyAcc_MeanValue_Y                  	Hz   [0-50]
*	FFT_BodyAcc_StandardDeviation_X          	Hz   [0-50]
*	FFT_BodyAcc_StandardDeviation_Z          	Hz   [0-50]
*	FFT_BodyAccJerk_MeanValue_Y              	Hz   [0-50]
*	FFT_BodyAccJerk_StandardDeviation_X      	Hz   [0-50]
*	FFT_BodyAccJerk_StandardDeviation_Z      	Hz   [0-50]
*	FFT_BodyGyro_MeanValue_Y                 	Hz   [0-50]
*	FFT_BodyGyro_StandardDeviation_X         	Hz   [0-50]
*	FFT_BodyGyro_StandardDeviation_Z         	Hz   [0-50]
*	FFT_BodyAccMag_StandardDeviation         	Hz   [0-50]
*	FFT_BodyBodyAccJerkMag_StandardDeviation 	Hz   [0-50]
*	FFT_BodyBodyGyroMag_StandardDeviation    	Hz   [0-50]
*	FFT_BodyBodyGyroJerkMag_StandardDeviation	Hz   [0-50]
````





# GettingCleaningData

Getting and Cleaning Data - Course Project

This project repository contains below file:
* CodeBook.md: Code book for the course project describing input/output variables and transformation steps applied to get tidy dataset
* README.md: Markup (this) document describing the repository and 
* run_analysis.R : R script which performs the below steps
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Running run_analysis.R
* Create a folder/directory and copy the above R Script to this directory
* Download the getdata-projectfiles-UCI HAR Dataset folder and unzip the UCI HAR Dataset into a new directory "Data" within the working directory
* Run the R script run_analysis.R which will create output file "tidydata.txt" in the current working directory containing the tidy dataset.


### Below Transformations are applied by the R script
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

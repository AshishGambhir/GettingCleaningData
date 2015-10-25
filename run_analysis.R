
#########################
##  HELPER FUNCTIONS   ##
#########################

  describe <- function(x)
  {
    print("#########################################")
    print(paste("#### CLASS: " , class(x)))
    print(paste("#### COLNAMES: " , toString(names(x))))
    print(paste("#### LENGTH: " , length(x)))
    print(paste("#### DIM: " , toString(dim(x))))
    print("#### HEAD :" )
    print(head(x,2))
    print("#### TAIL :")
    print(tail(x,2))
    print("#########################################")
  }


#########################
##    MAIN FUNCTION    ##
#########################


#### STEP-1: Set-up Step

  library(data.table)
  wdir = "C:/Users/Ashish/DSCourse/gcdata/Project"
  datadir = paste( wdir , "/Data", sep ="")
  traindatadir = paste( wdir , "/Data/train", sep ="")
  testdatadir = paste( wdir , "/Data/test", sep ="")
  outputfile = paste (wdir, "/tidydata.txt", sep ="")

## STEP-2: Read all Input files ##

  # Read Features and Activity info
  setwd(datadir)
  activity_labels <- read.table("activity_labels.txt")
  describe(activity_labels)

  features <- read.table("features.txt")
  describe(features)

  # Read Training Data
  setwd(traindatadir)
  X_train <- read.table("X_train.txt")
  #describe(X_train)


  Y_train <- read.table("y_train.txt")
  describe(Y_train)

  subject_train <- read.table("subject_train.txt")
  describe(subject_train)

  # Read Test Data
  setwd(testdatadir)
  X_test <- read.table("X_test.txt")
  describe(X_test)

  Y_test <- read.table("y_test.txt")
  describe(Y_test)

  subject_test <- read.table("subject_test.txt")
  describe(subject_test)

  
## STEP-3: Implement Part#1 of Course Assignment ##
    
  # Merge the training and the test sets to create one data set.
  X_joindata       <- rbind(X_train, X_test)
  Y_joindata       <- rbind(Y_train, Y_test)
  subject_joindata <- rbind(subject_train, subject_test)


  
## STEP-4: Implement Part#2 of Course Assignment ##
  
  # Extract only the measurements on the mean and standard deviation for each measurement.
  extract_indices    <- grep("mean\\(\\)|std\\(\\)", features[, 2])
  describe(extract_indices)
  extracted_features <- features[extract_indices,2]
  describe(extracted_features)
  X_subsetdata       <- X_joindata[,extract_indices]

  
## STEP-5: Implement Part#3 of Course Assignment ##
  
  # Uses descriptive activity names to name the activities in the data set
  Y_joindata[,2] <- activity_labels[Y_joindata[, 1], 2]
  names(Y_joindata) <- c("Activity", "ActivityDescription")
  names(subject_joindata) <- c("Subject")
  
  
## STEP-6: Implement Part#4 of Course Assignment ##
  
  # Appropriately labels the data set with descriptive variable names
  nm <- features[extract_indices, 2]
  nm <- gsub("^t", "Time_", nm)
  nm <- gsub("^f", "FFT_", nm)
  nm <- gsub("-mean\\(\\)", "_MeanValue", nm)
  nm <- gsub("-std\\(\\)", "_StandardDeviation", nm)
  nm <- gsub("-X", "_X", nm)
  nm <- gsub("-Y", "_Y", nm)
  nm <- gsub("-Z", "_Z", nm)
  names(X_subsetdata) <- nm

    
## STEP-7: Implement Part#5 of Course Assignment ##
    
  # From the data set in step 4, create a second, independent tidy data set
  # with the average of each variable for each activity and each subject.

  mergeddata <- cbind(subject_joindata[,1], Y_joindata[,2], X_subsetdata)
  names(mergeddata) <- c( names(subject_joindata)[1], names(Y_joindata)[2], names(X_subsetdata))
  tidydata <-  aggregate(mergeddata[, 3:ncol(mergeddata)], by=list(Subject = mergeddata$Subject, Activity = mergeddata$ActivityDescription), mean)
  tdata <- tidydata[order(tidydata$Subject, tidydata$Activity ),]
  write.table(tdata, file=outputfile, row.names=FALSE, col.names=TRUE)

    
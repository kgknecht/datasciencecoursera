##############
## C3 - Getting and Cleaning Data
## Course Project
## Last edited: 03/30/2021
##############

library(dplyr)

##############
## run_analysis
## This function prepares and returns a tidy data set that can be later used for analysis.
## It includes the following steps:
##  0 - Downloads and extracts the data set.
##  1 - Merges the training and the test sets to create one data set.
##  2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
##  3 - Uses descriptive activity names to name the activities in the data set.
##  4 - Appropriately labels the data set with descriptive variable names. 
##  5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
############## 
run_analysis <- function() {
  ###
  # #Step 0: Preparation - Check if required data sets are available, download and unzip data sets if needed
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  
  if(!file.exists("data")){
    dir.create("data")
  }
  if(!file.exists("./data/accelerometer_data.zip")){
    download.file(fileUrl, destfile = "./data/accelerometer_data.zip", method = "curl")
    dateDownloaded <- date()
  }
  if(!file.exists("./data/UCI HAR Dataset")){
    unzip("./data/accelerometer_data.zip", exdir = "./data")
  }
  
  ###
  # #Step 1: Read and then merge the required training and test data sets to create one data set.
  #          Rename the variables/columns according to the feature list and add more descriptive names 
  #          before merging to remove duplicates.
  
  # Read training and test sets of subjects, features (X), and activities (Y) from given txt files
  subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
  subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
  
  X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
  X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
  
  Y_train <- read.table("./data/UCI HAR Dataset/train/Y_train.txt")
  Y_test <- read.table("./data/UCI HAR Dataset/test/Y_test.txt")
  
  # Bind training and test data sets for subjects, features and activities respectively, 
  # Rename variables to remove duplicate variable names (V1) across data sets before merging
  subjects <- rbind(subject_train, subject_test)
  subjects <- rename(subjects, subject = V1) #Rename nondescript variable in subjects to "subject"
  
  X <- rbind(X_train, X_test)
  features <- read.table("./data/UCI HAR Dataset/features.txt")
  names(X) <- features$V2 #Substitute nondescript variable names with feature names
  
  Y <- rbind(Y_train, Y_test)
  Y <- rename(Y, activity = V1) #Rename nondescript variable in Y to "activity"
  
  # Merge data sets to create one
  dataset <- cbind(subjects, Y, X) 
  
  ###
  # #Step 2: Extract only the mean and standard deviation for each measurement from the list of 
  #          features, i.e. variables.
  dataset <- select(dataset, subject, activity, matches("(mean|std)[(][)]"), )
  dataset <- dataset[complete.cases(dataset),] #check for complete cases and remove rows that are incomplete
  
  ###
  # #Step 3: Use descriptive activity names to name the activities in the data set using the activity labels 
  #          provided in the activity_labels.txt file.
  activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
  
  # Loop over list of activity labels and substitute respective entries in the data set
  for(i in activity_labels$V1){ 
    dataset$activity[dataset$activity == i] <- activity_labels$V2[i]
  }
  
  ###
  # #Step 4: Appropriately label the data set with descriptive variable names.
  
  # Remove unwanted characters - and ()
  names(dataset) <- gsub("-", "", names(dataset)) #Removes '-' in variable names
  names(dataset) <- gsub("[(][)]", "", names(dataset)) #Removes subsequent brackets in variable names
 
  # Change lower case words in variable names to upper case to improve readability
  names(dataset) <- sub("mean", "Mean", names(dataset)) 
  names(dataset) <- sub("std", "StandardDeviation", names(dataset)) 
  
  # Remove abbreviations
  names(dataset) <- sub("Acc", "Accelerometer", names(dataset))
  names(dataset) <- sub("Freq", "Frequency", names(dataset)) 
  names(dataset) <- sub("Gyro", "Gyroscope", names(dataset))
  names(dataset) <- sub("Mag", "Magnitude", names(dataset))
  names(dataset) <- sub("^t", "timeDomainSignal", names(dataset))
  names(dataset) <- sub("^f", "frequencyDomainSignal", names(dataset))
  names(dataset) <- sub("[(][t]", "(timeDomainSignal", names(dataset))
  
  ###
  # #Step 5: From data set in Step 4 create a second, independent tidy data set with the average of 
  #          each variable for each activity and each subject
  tidyDataset <- group_by(dataset, subject, activity) #First group data set by subject and activity
  tidyDataset <- summarize_all(tidyDataset, mean) #Then summarize all variables using mean

  # Write tidy data set to txt file
  write.table(tidyDataset, file = "./data/tidy_UCI_HAR_dataset.txt",row.names=FALSE)
}
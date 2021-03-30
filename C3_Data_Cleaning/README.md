---
title: "README"
author: "K Knecht"
date: "30/03/2021"
output: html_document
---

# Getting and Cleaning Data Course Project

### Introduction
The purpose of this project as part of the third course in the Data Science Specialization on coursera is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The data set used in this project is the *Human Activity Recognition Using Smartphones Dataset* (UCI HAR) by [1]. 

### Description
For the course project the R script **run_analysis.R** was created, which contains the function **run_analysis()**. This function prepares a tidy data set based on the *Human Activity Recognition Using Smartphones Dataset* [1] that can be later used for analysis. The tidy data set is written into a txt file called "**tidy_UCI_HAR_dataset.txt**", which can be found in the data folder.

To clean and transform the given data set, the function run_analysis() performs the following steps:

* **Step 0**: Downloads and extracts the data set (if required).

* **Step 1**: Reads and then merges the required training and test data sets of subjects, features (X), and activities (Y) to create one data set. Renames the variables/columns according to the feature list and adds more descriptive names before merging to remove duplicates.

* **Step 2**: Extracts only the measurements on the mean and standard deviation for each measurement. 

* **Step 3**: Uses descriptive activity names to name the activities in the data set.

* **Step 4**: Appropriately labels the data set with descriptive variable names by removing unnecessary characters and abbreviations. 

* **Step 5**: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. It writes this data set into a txt file called 'tidy_UCI_HAR_dataset.txt'.

Comments in the code indicate the respective steps.

### Files
The submission contains the following files:

* 'run_analysis.R': The R code used to clean and transform the given data set in order to provide the tidy UCI HAR data set.

* 'data/tidy_UCI_HAR_dataset.txt': The tidy UCI HAR data set.

* 'data/UCI HAR Dataset': The folder containing the original UCI HAR data set.

* 'CodeBook.md': The code book for the tidy UCI HAR data set.

* 'README.md': This README file.


### References:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

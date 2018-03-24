# Getting-and-Cleaning-Data
### This repository fulfills the requirements for Coursera Getting and Cleaning Data Week 4 project

The purpose of this project is to demonstrate an ability to collect, work with, and clean a data set. Requirements include the following:
  1) a tidy data set which can be used for later analysis - tidydata.txt
  2) an R-script that performs the operations to produce the tidy data set - run_analysis.R
  3) a code book that describes the data, the variables and any transformations or work that performed to clean the data - CodeBook.md
  4) this README.md document which explains the project, the process and the results
  5) the link for this repository, submitted to Coursera
  
The source data for the project came from this study:

  Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.  
  A Public Domain Dataset for Human Activity Recognition Using Smartphones.  
  21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013.  
  Bruges, Belgium 24-26 April 2013.
  

A full description is available at the site where the data was obtained:
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data are available here:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
  
### The data  
Data are packaged in the zip archive, UCI_HAR_Dataset.zip, in the form of text files.  The files required for this project are included in the annotated list below:  

  > "./data/UCI HAR Dataset/README.txt"  
  >> background information on the HAR study  
      
  - "./data/UCI HAR Dataset/features_info.txt"   
      - detailed information about the instruments/measured used to generate observations  
      
  - "./data/UCI HAR Dataset/activity_labels.txt"  
      - labels for six activities observed in the study  

  - "./data/UCI HAR Dataset/features.txt"  
      - A 561-feature vector with time and frequency domain variables  

  - "./data/UCI HAR Dataset/test/X_test.txt"  
      - the test set; observations from a test phase of the study; a space-delimited file with 2947 observations (rows) and 561 variables (columns)  
  
  - "./data/UCI HAR Dataset/test/subject_test.txt"  
      - subjectIds, a one column vector with 2947 rows, corresponding to observations in "X_test.txt"  

  - "./data/UCI HAR Dataset/test/y_test.txt"  
      - activityIds, a one column vector with 2947 rows, corresponding to observations in "X_test.txt"  
      
  - "./data/UCI HAR Dataset/train/X_train.txt"  
      - the training set; observations from a training phase of the study; a space-delimited file with 7352 observations (rows) and 561 variables (columns)  
      
  - "./data/UCI HAR Dataset/train/subject_train.txt"  
      - subjectIds, a one column vector with 7352 rows, corresponding to observations in "X_train.txt"  
      
  - "./data/UCI HAR Dataset/train/y_train.txt"  
      - activityIds, a one column vector with 7352 rows, corresponding to observations in "X_train.txt"  
  
  
A file was written to the local archive, "./data/UCI HAR Dataset/tidydata.txt".  A copy is included in this repository as per project requirements.  This is a space delimited text file representing 180 observations, not including column names, which are presented in the first row.  There are 69 columns, including subjectId, activityId, activity label, and 66 measures (features).  

### The R-script "run_analysis.R"
Also included in this repository, this script performs all the operations to produce the tidy data text file.  These operations are listed below. Some operations depend upon the tidyverse package, so the first step is to load tidyverse.  

- Download files, extract to local directory, list the files to show archive contents

- Read the data for training and test files
  - x_train.txt and x_test.txt contain observations from the study
  - y_train.txt and y_test.txt contain corresponding activity codes
  - subject_train.txt and subject_test.txt contain corresponding subject Ids
  - features.txt contains variable names

- assign column names to the six data frames created

- Merge training and test sets to create one data set (ODS); cbind() merges X_train, Y_train, and subject_train;
  - cbind() merges X_test, Y_test, and subject_test; rbind() merges train and test
  - The result is a data frame with 10,299 observations and 563 variables, including subjectID, activityID and 561 'features'

- Subset the data to obtain the mean and standard deviation measurements for each variable.
  - This produces a data frame with 10,299 observations and 68 variables, including subjectID, activityID and 66 'features'

- Use activityID to add activity labels to the data frame.

- Create a second, independent tidy data set with the average of each variable for each activity and each subject.
  - The result is a data frame with 180 observations and 69 columns, representing grouped averages of the 66 feature measures, grouped by subjects (30) and activity (6)
  
- Write this out as a text file for project submission.

### CodeBook.md  
CodeBook.md describes the variables, the data, any operations performed to clean up the data, and any other relevant information.

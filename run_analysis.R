#This script was written to fulfill the week 4 project
#for the Getting and Cleaning Data course (Coursera).

#The tidyverse package is required to support operations in this script.
library(tidyverse)

#Download files, extract to local directory, list the files to show archive contents
url1="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    if(!file.exists("./data")){dir.create("./data")}
    download.file(url1, tmp <- tempfile(fileext = ".zip"))
    unzip(tmp, exdir = "./data")
    (list.files("./data/UCI HAR Dataset", full.names = TRUE, recursive = TRUE))

#Read the data for training and test files
#x_train.txt and x_test.txt contain subject observations from the study
#y_train.txt and y_test.txt contain corresponding activity codes
#subject_train.txt and subject_test.txt contain corresponding subject Ids
#features.txt contains variable names 
    
    #training tables
    x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
    y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
    subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

    #test tables
    x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
    y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
    subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

    #features
    features <- read.table('./data/UCI HAR Dataset/features.txt')

#assign column names
    colnames(x_train) <- features[,2] 
    colnames(y_train) <-"activityId"
    colnames(subject_train) <- "subjectId"

    colnames(x_test) <- features[,2] 
    colnames(y_test) <- "activityId"
    colnames(subject_test) <- "subjectId"

#Merge training and test sets to create one data set (ODS)
    m_train <- cbind(y_train, subject_train, x_train)
    m_test <- cbind(y_test, subject_test, x_test)
    ODS <- rbind(m_train, m_test)

#Subset the data to obtain the mean and standard deviation measurements for each variable.
    mean_std <- subset(ODS, select=c(1:2, grep("mean\\(\\)|std\\(\\)", names(ODS))))

#Label this data set with descriptive variable names using activity labels
#merge activity_labels.txt with mean_std
    activity_labels = read.table('./data/UCI HAR Dataset/activity_labels.txt')
    colnames(activity_labels) <- c('activityId','activity')
    
    activity_mean_std <- merge(activity_labels, mean_std, by='activityId', all.x=TRUE)

#Create a second, independent tidy data set with the average of each variable
#for each activity and each subject.
#Write this out as a text file for project submission.
    tidydata <- activity_mean_std %>% group_by (subjectId,activityId,activity) %>% summarize_all("mean")
    write.table(tidydata, "./data/UCI HAR Dataset/tidydata.txt", row.name=FALSE)


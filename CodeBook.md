
#Code Book  

### Summary and objective  
This project looks at secondary data from a public domain database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.  Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The smartphones were equipped with an accelerometer to measure linear acceleration and a gyroscope to measure angular velocity (radians/second).  Subjects data were randomly partitioned into two sets, a training set (70% of volunteers) and a test set (30% of volunteers).  The current project was not concerned with training and testing, instead the objective was to consolidate the data into a single dataset, then extract a subset of particular measures, and output a tidy data set of group averages for those measures.

### Data  
The data is available in a zip archive containing a set of text files.  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  Available data had already been pre-processed, filtered, transformed and summarized by various statistics.  Still, the data set contains 10,299 observations from 30 volunteers, performing 6 activities, across a vector of 561 data features.  

The base set of observations, for training and test, did not include subjectId, activityId, nor any variable (feature) identification.  Instead, these were represented in separate files.  All files were text files, as follows:  
- X_train.txt - base data, training set  
- X_test.txt - base data, test set  
- Y_train.txt - single column vector of activityId, training set  
- Y_text.txt - single column vector of activityId, test set  
- subject_train.txt - single column vector of subjectId, training set  
- subject_test.txt - single column vector of subjectId, test set  

An ordinal correspondence was assumed for X-train.txt, Y_train.txt, and subject_train.txt; similarly for X-test.txt, Y_test.txt, and subject_test.txt.  
On that assumption, the training files were conjoined, the test files were conjoined, columnwise, adding subjectId and activityId to the base measures.  Then training and test data were conjoined by rows into a single data set.  

A separate file, features.txt, a 561-feature vector with time and frequency domain variables, provided column names for the 561 measures in the base data (training and test).  These column names - feature labels - were partially descriptive, sufficient for selecting mean and standard deviation from among 20 different statistics calculated on various different sensor signals.  

The output of this project is a summary of a subset of the available data, providing grouped averages of the mean and standard deviation for the various sensor signals, grouped by subject and activity.  Hence, the output data (a tidy data set - "tidydata.txt") consists of 180 group observations (30 subjects and 6 activities), across 33 means and 33 standard deviations obtained originally from the different sensor signals of linear acceleration and angular velocity, appropriately identified by subject, activity, and 'feature'.  

### Variables  
It would no doubt be contextually helpful to provide some clarification of the detailed measurements of linear acceleration and angular velocity taken from 30 subjects on 6 activities, in 3 dimensions (directions), and how these were pre-processed, filtered, transformed and analyzed, resulting in 561 'features'.  Except to say that means and standard deviations for each of 33 features were selected as a subset, this is beyond the scope of the current project and was not attempted.  

The study engaged 30 volunteer participants, unidentified except for subjectId.  They engaged in six different activities:  
  - 1 WALKING  
  - 2 WALKING_UPSTAIRS  
  - 3 WALKING_DOWNSTAIRS  
  - 4 SITTING  
  - 5 STANDING  
  - 6 LAYING  
  
  ### Transformations and operations  
  Input data had previously been processed and summarized.  No further transformations of the data were undertaken.  Files were consolidated to create a single dataset with appropriate group identification, of subject and activity.  
  A subset of particular variables was extracted and averaged by group (subject and activity).  
  The resulting tidy data set is included in this repository:  "tidydata.txt".
  

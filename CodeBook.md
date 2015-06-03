# Code Book - Project 1, Getting & Cleaning Data

This code book describes the variables, the data and transformation that
has been performed during the cleanup from the raw data set (see folder "UCI HAR Dataset")
to the tidy dataset (tidydata.df) using the script (run_analysis.R)

----

## Preliminary Information
Backgroundinformation on the considered raw dataset can be found on the following
website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

After downloading the data (in the Folder "UCI HAR Dataset"), you should also have
a look at the provided ReadMe file there. Note, that this Code Book cites relevant
parts of the mentioned ReadMe in order to clarify the information used from the dataset.

## Tidydata

### Preprocessing
First, the test and training data sets have been merged to one data frame.
This includes the sets:

- /test/subject_test.txt: 
- /test/X_test.txt: containing the test set
- /test/y_test.txt: containing the test labels
- /test/subject_test.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
- /train/subject_train.txt
- /train/X_train.txt: containing the training set
- /train/y_train.txt: containing the training labels
- /train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

! Note that the activity Id has been replaced by the activity, as given by

- /activity_labels.txt: Links the class labels with their activity name.

Only features/measurement on the mean and standard deviation for each measurement are considered.
These are defined as the ones containing either "mean" or "std" in their name.
Names in detail and further information, see:

- /features_info.txt
- /features.txt: List of all features. The ones with "mean" or "std" in the name are considered here! 79 in total

Additional Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

### The Dataset

1. merge test/train data and use activity names instead of Ids
2. reduce to those features, which are measurements on the mean or standard deviation of the measurements given
3. group by subjectId (volunteer Id) and activity
4. for these combinations, the mean values of all considered features are given

For instance tidydata[1,] yields:

______________________________________________________

| Variablename | example value | explanation |
| -------------|--------------|-----------|
|subjectId |  1      |   volunteer with Id 1|
|activity  | LAYING  |   activity was LAYING|
|tBodyAcc.mean...X | 0.2215982 | the mean of means of tBodyAcc in X direction of all the Laying Activities of volunteer 1|
|tBodyAcc.mean...Y | -0.04051395 | the mean of means of tBodyAcc in Y direction of all the Laying Activities of volunteer 1|
|tBodyAcc.mean...Z | -0.1132036 | the mean of means of tBodyAcc in Z direction of all the Laying Activities of volunteer 1|
|tBodyAcc.std...X  | -0.9280565 | the mean of standard deviations of tBodyAcc in X direction of all the Laying Activities of volunteer 1|
|tBodyAcc.std...Y  | -0.8368274 | the mean of standard deviations of tBodyAcc in Y direction of all the Laying Activities of volunteer 1|
|tBodyAcc.std...Z  | -0.8260614 | the mean of standard deviations of tBodyAcc in Z direction of all the Laying Activities of volunteer 1|

______________________________________________________
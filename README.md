# ReadMe

This is the Repository for the Course Project in the Getting and Cleaning Data Course on Coursera.
Instructions can be found here: 
It is part of the Data Scientists Track on Coursera: www.coursera.org which I highly recommend. Great course. :)

In here, you will find the description of the repository's content, i.e.:

* UCI HAR Dataset - folder
* CodeBook.md
* run_analysis.R
* tidydata.df

### Instructions for this Project
https://class.coursera.org/getdata-015/ -> Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 You should create one R script called run_analysis.R that does the following. 

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement. 
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names. 

    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!


### The Raw Dataset: UCI HAR Dataset Folder
The raw data set has been downloaded as a zip file from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
and extracted to the local working directory in the folder named
"UCI HAR Dataset"

### The CodeBook: CoodeBook.md
This code book describes the variables, the data and transformation that
has been performed during the cleanup from the raw data set (see folder "UCI HAR Dataset")
to the tidy dataset

### The Script: run_analysis.R
This script guides through all the necessary steps in order to get from the raw data
in folder "UCI HAR Data to the tidy dataframe 

### The Tidy Data: tidydata.df
The tidy dataframe we get after running run_analysis. 
It provides the average Values of all considered features (i.e. means and standard
deviations), grouped by subjects (who generated the data) and activity.
Detailed Description see CodeBook.md
Steps to get there see run_analysis.R

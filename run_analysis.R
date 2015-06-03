# Script: run_analysis.R 

# This script aggregates all the steps performed in order to
# process the raw dataset in the folder "UCI HAR Dataset" to the tidy dataset
# ready for further analysis

library(dplyr)

#------------------------------------------------------------------------------
# Task 1: Merges the training and the test sets to create one data set.
#------------------------------------------------------------------------------

X.train <- read.table("UCI HAR Dataset/train/X_train.txt")
Y.train <- read.table("UCI HAR Dataset/train/y_train.txt")
Subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt")
    
X.test <- read.table("UCI HAR Dataset/test/X_test.txt")
Y.test <- read.table("UCI HAR Dataset/test/y_test.txt")
Subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt")
    
X <- rbind(X.train, X.test)
Y <- rbind(Y.train, Y.test)
Subject <- rbind(Subject.train, Subject.test)
    
data <- cbind(Subject, X, Y)
# and to make clear, how the data frame is set up, we add the respective variable names
features <- read.table("UCI HAR Dataset/features.txt")
featurenames <- make.names(features[,2])
names(data)[1] <- "subjectId" 
names(data)[563] <- "activityId"
names(data)[2:562] <- featurenames
    
# tidy up the data frames we dont need anymore:
rm(X.train, Y.train, Subject.train, X.test, Y.test, Subject.test, X, Y, Subject, features, featurenames)
    
#------------------------------------------------------------------------------
# Task 2: Extracts only the measurements on the mean and standard deviation for each measurement.
#------------------------------------------------------------------------------
# Note: go for all the feature names with "mean" or "std" in it.
# and of course, we aim to keep the subject and activity Id:    

data <- data[,grepl("Id", names(data)) | grepl("mean", names(data)) | grepl("std", names(data))]


#------------------------------------------------------------------------------
# Task 3: Uses descriptive activity names to name the activities in the data set
#------------------------------------------------------------------------------

activitylist <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activitylist) <- c("activityId", "activity")

data$activity <- as.factor(as.character(activitylist[data$activityId,2]))
data <- select(data, -activityId)

rm(activitylist)

#------------------------------------------------------------------------------
# Task 4: Appropriately labels the data set with descriptive variable names. 
#------------------------------------------------------------------------------

# already done in task 1! its the part where the names were added from the
# freature_info list instead of v1,v2,..

#------------------------------------------------------------------------------
# Task 5: From the data set in step 4, creates a second, independent tidy data set with the
# average of each variable for each activity and each subject.
#------------------------------------------------------------------------------

data.activity <- data %>%
                 group_by(subjectId, activity) %>%
                 summarise_each(funs(mean))    
write.table(data.activity, file = "tidydata.df")
tidydata <- read.table("tidydata.df") #not necessary, only a short test whether the write.table defaults are fine :)

# Note: summarise_each applies the defined functions (here: mean) to all
# the columns. This is handy as here there are many variables given.
# For simplicity, and in order to see the effect quickly at one glance, I arranged
# the set by subjectId first, then by activity as every subject had 6 activities
# so you can see the build up of the final tidy dataset easily.
# For the "real" analysis, it might be more useful to have an activity - subjectId
# view, or even group_by activity only. However, this depends on the questions
# to be addressed in the study. 


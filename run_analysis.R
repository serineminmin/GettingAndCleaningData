#### Getting and Cleaning Data Week 4 Assignment #####

#### Set Working Directory ####
setwd("~/Desktop/Training/Coursera/Getting and Cleaning Data/UCI HAR Dataset/")

####Load all related libraries ####
# install.packages("downloader")
library(downloader)
library(dplyr)
library(stringr)

#### Download dataset ####
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(url, dest="HAR_dataset.zip", mode="wb") 
unzip ("HAR_dataset.zip", exdir = "./")

#### Read features for column headers ####
features <- read.table("features.txt")
head(features)

#### Read train data and Appropriately labels the data set with descriptive variable names ####
X_train_set <- read.table("train/X_train.txt")
# summary(X_train_set)
names(X_train_set) <- features$V2
Y_train_set <- read.table("train/y_train.txt")
names(Y_train_set) <- "labels"
subject_train_set <- read.table("train/subject_train.txt")
names(subject_train_set) <- "subject"

train_set <- X_train_set %>% 
  cbind(Y_train_set) %>% 
  cbind(subject_train_set)
train_set$subject_group <- "train"

#### Read test data and Appropriately labels the data set with descriptive variable names ####
X_test_set <- read.table("test/X_test.txt")
names(X_test_set) <- features$V2
Y_test_set <- read.table("test/y_test.txt")
names(Y_test_set) <- "labels"
subject_test_set <- read.table("test/subject_test.txt")
names(subject_test_set) <- "subject"

test_set <- X_test_set %>% 
  cbind(Y_test_set) %>% 
  cbind(subject_test_set)
test_set$subject_group <- "test"

#### Merges the training and the test sets to create one data set ####
ds <- rbind(train_set, test_set)

#### Extracts only the measurements on the mean and standard deviation for each measurement ####
ds_subset <- ds[ , grepl( "(.*(mean|std)\\(\\).*)|labels|subject" , names(ds) ) ]

#### Uses descriptive activity names to name the activities in the data set ####
# Reading in activity_labels.txt for this 
activity <- read.table("activity_labels.txt")
names(activity) <- c("labels", "activity_labels")

ds_subset <- ds_subset %>% 
  left_join(activity, by="labels")

#### Appropriately labels the data set with descriptive variable names ####
# Quick check
names(ds_subset)
# OUTPUT from Step 4: ds_subset

#### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject ####
# will drop "subject_group" which is a train or test distinction as it appears to not be used by any part in this assignment!
tidy_ds <- ds_subset %>% 
  select (-c(subject_group, labels)) %>% 
  group_by(subject, activity_labels) %>% 
  summarise_all(funs(mean))
# OUTPUT from Step 5: tidy_ds

#### Please upload the tidy data set created in step 5 of the instructions. Please upload your data set as a txt file created with write.table() using row.name=FALSE (do not cut and paste a dataset directly into the text box, as this may cause errors saving your submission). ####
write.table(tidy_ds, "tidy_dataset.txt", row.names = FALSE)

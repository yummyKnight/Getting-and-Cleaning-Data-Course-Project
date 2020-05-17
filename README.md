# Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Course Project from Getting and Cleaning Data course from Coursera.
## Task
You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files

Resulting tidy data from task 5 can be found in fullDatasetMean.csv.

Resulting tidy data from task 4 can be found in fullDataset.csv.

Codebook for aggregated data set can be found in CODEBOOK.md.

Source code can be found in run_analysis.R.

## Preparation
First of all you need download  a dataset, that specified in task: 
```
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip")
unzip("dataset.zip")
```
## Constructing run_analysis.R

### Step 1. Loading features, labels and subject for test and train

```
features <- read.table("features.txt", colClasses = "character")
activity_lables <- read.table("activity_labels.txt")

test_labels <- read.table("test/y_test.txt", colClasses = "character")
train_labels <- read.table("train/y_train.txt", colClasses = "character")

test_subject <- read.table("test/subject_test.txt",)
train_subject <- read.table("train/subject_train.txt")
```
### Step 2. Selecting only features names that we need (containing mean and std)
**IMPORTANT** 

Regex: ```.*mean.*\\(\\)|.*std\\(\\)``` respond to all words with mean(),std() and meanFreq(). Exactly what we need.

```
needed_features <- tbl_df(features) %>% filter(grepl(".*mean.*\\(\\)|.*std\\(\\)", V2)) %>% mutate(V1 = as.numeric(V1)) %>% rename(num = V1, feature = V2)
```
needed_features contain 2 columns. 1 - numbers. 2 - strings. 1st column can be used to extract only needed columns from X_train and X_test files
### Step 3. Getting data from files
```
test_data <- read.table("test/X_test.txt", colClasses = "numeric")[,needed_features$num]
train_data <- read.table("train/X_train.txt", colClasses = "numeric")[,needed_features$num]
```
### Step 4. Setting clean names to columns of dataset (cleaning it from non alphanumeric character)
```
nice_names_for_feature <- gsub("[[:punct:]]", "", needed_features$feature)
names(test_data) <- nice_names_for_feature
names(train_data) <- nice_names_for_feature
```
### Step 5. Adding "subject" and "activityType" columns for both test and train datasets
```
test_data <- tbl_df(test_data)
test_data <- test_data %>% mutate(subject = test_subject$V1)
test_data <- test_data %>% mutate(activityType = factor(test_labels$V1, activity_lables$V1, activity_lables$V2))

train_data <- tbl_df(train_data)
train_data <- train_data %>% mutate(subject = train_subject$V1)
train_data <- train_data %>% mutate(activityType = factor(train_labels$V1, activity_lables$V1, activity_lables$V2))
```
### Step 6. Merging datasets (binding rows) and writing to file
```
full_dataset <- bind_rows(test_data, train_data)
write.csv(full_dataset, "fullDataset.csv", row.names = F)
```

### Step 7. Creating a second, independent tidy data set with the average of each variable for each activity and each subject and writing to file
```
full_dataset.mean <- group_by(full_dataset, subject, activityType) %>% summarise_all(.funs = mean)
write.csv(full_dataset.mean, "fullDatasetMean.csv", row.names = F)
```
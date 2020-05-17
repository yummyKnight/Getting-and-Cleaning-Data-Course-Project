# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip")
# unzip("dataset.zip")
library(dplyr)
setwd("UCI HAR Dataset/")

features <- read.table("features.txt", colClasses = "character")
activity_lables <- read.table("activity_labels.txt")

test_labels <- read.table("test/y_test.txt", colClasses = "character")
test_subject <- read.table("test/subject_test.txt",)

train_labels <- read.table("train/y_train.txt", colClasses = "character")
train_subject <- read.table("train/subject_train.txt")

needed_features <- tbl_df(features) %>% filter(grepl(".*mean.*\\(\\)|.*std\\(\\)", V2)) %>% mutate(V1 = as.numeric(V1)) %>% rename(num = V1, feature = V2)

test_data <- read.table("test/X_test.txt", colClasses = "numeric")[,needed_features$num]
train_data <- read.table("train/X_train.txt", colClasses = "numeric")[,needed_features$num]

nice_names_for_feature <- gsub("[[:punct:]]", "", needed_features$feature)
names(test_data) <- nice_names_for_feature
names(train_data) <- nice_names_for_feature

test_data <- tbl_df(test_data)
test_data <- test_data %>% mutate(subject = test_subject$V1)
test_data <- test_data %>% mutate(activityType = factor(test_labels$V1, activity_lables$V1, activity_lables$V2))

train_data <- tbl_df(train_data)
train_data <- train_data %>% mutate(subject = train_subject$V1)
train_data <- train_data %>% mutate(activityType = factor(train_labels$V1, activity_lables$V1, activity_lables$V2))

full_dataset <- bind_rows(test_data, train_data)

full_dataset.mean <- group_by(full_dataset, subject, activityType) %>% summarise_all(.funs = mean)

setwd("../")
write.csv(full_dataset, "fullDataset.csv", row.names = F)
write.csv(full_dataset.mean, "fullDatasetMean.csv", row.names = F)
library(dplyr)

# Reading the test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Reading the train data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Reading features and activity labels data
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Merges the training and the test sets to create one data set
x_set <- rbind(x_test, x_train)
y_set <- rbind(y_test, y_train)
subject_set <- rbind(subject_test, subject_train)
total_set <- cbind(y_set, subject_set, x_set)

# Extracts only the measurements on the mean and standard deviation for each measurement
measurements_mean_and_sd <- grep("-(mean|std)\\(\\)", features[, 2])
total_set <- total_set[, c(1,2,(measurements_mean_and_sd + 2))]

# Uses descriptive activity names to name the activities in the data set
total_set[, 1] <- activity_labels[total_set[, 1], 2]

# Appropriately labels the data set with descriptive variable names
names(total_set)[1] <- "activity"
names(total_set)[2] <- "subject"
names(total_set)[3:68] <- features$V2[measurements_mean_and_sd]

# creates tidy data set with the average of each variable for each activity and each subject
averages_data <- total_set %>%
  group_by(activity, subject) %>%
  summarize_all(mean)

write.table(averages_data, "averages_data.txt")
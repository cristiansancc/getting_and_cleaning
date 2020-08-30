# Getting-and-Cleaning-Data-Course-Project

Information about the R scripts used for the Getting and Cleaning Data project. The project is based on data collected  from the accelerometers from the
Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data for this project contained in datazip file has been downloaded and unzipped

At first, alternatly I read the test and train data and features and activity labels data using read.table(). I got 7352 observations in train data set
and 2947 observations in test data set in 561 features, 30 subjects and 6 activity labels.

All data sets (test and train) have the same dimensions, so I use rbind() and cbind() functions to put data together in one data set (total_set).

For extracts only the measurements on the mean and standard deviation for each measurement I use grep() with regular expression for names that include "mean()" and "std()". As I put activity and subject in first two columns total_set I shift indixes by two positions.

For replacing activity numbers with descriptive terms use activity_labels data

For descriptive variable names use indexes from step 2 for features data.

Finally I group data by activity and subject and summurise all variables whith mean function

As a result I get tidy data since: columns have headings, the variables  are in different columns, there are no duplicate columns

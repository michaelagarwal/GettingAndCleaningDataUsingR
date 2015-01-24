##################################################
# This program is for project work for Getting and Cleaning Data
# Author: Michael Agarwal
# Date Written: 01/24/2015
##################################################
#   Step 1: Merges the training and the test sets to create one data set.
#   Read training data set
X_train <- read.table("../X_train.txt")
#   Read test data set
X_test <- read.table("../X_test.txt")
# merge training and test data sets
X_all <- rbind(X_train,X_test)
##################################################
#   Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
#   Get column names from features.txt 
X_column_names_table <- read.table("../features.txt")
#   Set column names
library(data.table)
setnames(X_all,as.character(X_column_names_table$V2))
#   remove columns which does not end with -std() or -mean()
X_all_subset_1 <- X_all[ , which(names(X_all) %like% "-mean()")]
X_all_subset_2 <- X_all[ , which(names(X_all) %like% "-std()")]
X_all_subset <- cbind(X_all_subset_1, X_all_subset_2)
###################################################
#   Step 3: Uses descriptive activity names to name the activities in the data set
    Y_train <- read.table("../Y_train.txt")
    Y_test <- read.table("../Y_test.txt")
View(Y_test)
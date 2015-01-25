##################################################
# This program is for project work done for Getting and Cleaning Data
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
#   AND
#   Step 4: Appropriately labels the data set with descriptive variable names. 
#   Get column names from features.txt 
X_column_names_table <- read.table("../features.txt")
#   Set column names
library(data.table)
setnames(X_all,as.character(X_column_names_table$V2))
#   remove columns which does not end with -std() or -mean()
X_all_subset_1 <- X_all[ , which(names(X_all) %like% "-mean()")]
X_all_subset_2 <- X_all[ , which(names(X_all) %like% "-std()")]
#   This following data set will be used for final tidy data for measurements
Data_set_final <- cbind(X_all_subset_1, X_all_subset_2)
###################################################
#   Step 3: Uses descriptive activity names to name the activities in the data set
Y_train <- read.table("../Y_train.txt")
Y_test <- read.table("../Y_test.txt")
Activity <- read.table("../activity_labels.txt")
Y_train_new <- merge(Y_train, Activity, by="V1", sort = 'F')
Y_test_new <- merge(Y_test, Activity, by="V1", sort = 'F')  
#   This following data set will be used for final tidy data for activity
Activity_final <- rbind(Y_train_new,Y_test_new)
###################################################
#   Step 4: Appropriately labels the data set with descriptive variable names. 
#   Step 4 was done with Step 2.
##################################################
#   Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
Subject_test <- read.table("../subject_test.txt")
Subject_train <- read.table("../subject_train.txt")
#   This following data set will be used for final tidy set for subjects
Subject_final <- rbind(Subject_train,Subject_test)
# Put all data together in one dataset and give meaningful names
All_final <- cbind(Subject_final$V1,Activity_final$V2,Data_set_final)
colnames(All_final)[1]<-"Subject"
colnames(All_final)[2]<-"Activity"
# Prepare tidy set and export it into text file
All_final <- as.data.table(All_final)
variables <- tail( names(All_final), -5)
Tidy_data <- All_final[, lapply(.SD, mean), .SDcols=variables, by=list(Subject, Activity)]
write.table(Tidy_data, file="Tidy_data_set.txt",row.name=FALSE)

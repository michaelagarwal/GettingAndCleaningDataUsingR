### Code book for Getting and cleaning data collected from the accelerometers
### Author: Michael Agarwal (https://github.com/michaelagarwal/ProjectForGettingAndCleaningData)
### Date Written: 01/23/2015

### Variables and data
Data from accelerometers: There are 10299 observations (561 columns), they are listed in X_train.txt and X_test.txt
Features (i.e column names): There are 561 values, they are listed in Features.txt
Activity Description: Activity description (6 values) are stored in activity_labels.txt
Activity for each observation: Activity for each of 10299 observations is stored in single column in Y_train.txt and Y_test.txt
Subjects for each observation: Subjects for each of 10299 observations is stored in subjects_test.txt and subjects_train_txt


### Logic and transformations used in this run_analysis.R is

#### 1. Download data from here
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#### 2. Read Readme.txt and understand files

#### 3. Load X_test.txt and X_train.txt, and view them, they have 561 columns

#### 4. Merge these two data sets using rbind()

#### 5. Read columns names from features.txt and assign them to 561 columns

#### 6. Filter out columns which are not needed and only keep columns which have names like mean and std

#### 7. Read activity labels and match them with activity listed in Y_train.txt and Y_test.txt

#### 8. Read subjects for each of 10299 obseervations

#### 9. Merge #6, #7 and #8 to have subjects, activity and observations into single data frame

#### 10. Get mean of all observations grouped by subjects and activity and exported it into text file

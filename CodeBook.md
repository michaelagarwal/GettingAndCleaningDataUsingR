### Code book for Getting and cleaning data collected from the accelerometers
#### Author: Michael Agarwal (https://github.com/michaelagarwal/ProjectForGettingAndCleaningData)
#### Date Written: 01/23/2015

#### Variables and data
	1. Data from accelerometers: There are 10299 observations (561 columns), they are listed in X_train.txt and X_test.txt
	2. Features (i.e column names): There are 561 values, they are listed in Features.txt
	3. Activity Description: Activity description (6 values) are stored in activity_labels.txt
	4. Activity for each observation: Activity for each of 10299 observations is stored in single column in Y_train.txt and Y_test.txt
	5. Subjects for each observation: Subjects for each of 10299 observations is stored in subjects_test.txt and subjects_train_txt


#### Logic and transformations used in this run_analysis.R is

	1. Download data from here
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

	2. Read Readme.txt and understand files

	3. Load X_test.txt and X_train.txt, and view them, they have 561 columns

	4. Merge these two data sets using rbind()

	5. Read columns names from features.txt and assign them to 561 columns

	6. Filter out columns which are not needed and only keep columns which have names like mean and std

	7. Read activity labels and match them with activity listed in Y_train.txt and Y_test.txt

	8. Read subjects for each of 10299 obseervations

	9. Merge #6, #7 and #8 to have subjects, activity and observations into single data frame

	10. Get mean of all observations grouped by subjects and activity and exported it into text file

#### Other Useful Info which comes with this data set

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
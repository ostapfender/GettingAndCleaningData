==================================================================
First, features from "features.txt" and activity labels from "activity_labels.txt" are saved in 'features' and 'activities' variables of data frames.

As next step, test set is processed.
The content of all files in 'test' subfolder is saved in separte variables.
Next, variables in obtained datasets are given appropriate names as follows:
- single variable in "subject_test.txt" is called 'subj'
- the names for 561 variables in "X_test.txt" are taken from "features.txt"
- 128 body acceleration variables from "body_acc_x_test.txt" are named as 'body_x_{N}' where N is the number of variable
- 128 total acceleration variables from "total_acc_x_test.txt" are named as 'total_x_{N}' where N is the number of variable
- 128 angular velocity variables from "body_gyro_x_test.txt" are named as 'gyro_x_{N}' where N is the number of variable
- 'y' and 'z' variables from respective data frames are named similar to above for 'x'

Next, local 'test' data frame is initialised with subjects data.
Next, 'activity' variable of 'test' is assigned with activity labels from earlier obtained data frames

Next, 'rownames' variable is added to 'test' to name (in this case to create IDs) rows for further join.

Next, only mean() and std() type of features are taken from 'test_X' containing the data of "X_test.txt".
Next, 'rownames' variable is added to 'test_mean_std' to name (in this case to create IDs) rows for further join.

Next, 'rownames' variable is added to respecvtive data frames of body, total acceleration and angular velocity for 'x', 'y' and 'z' axes.

Next, prepared earlier data frames are joined on 'rownames' attribute which is removed at the next step.
==================================================================
The same set of operaions is performed on train set of data, containig in 'train' subfolder.
==================================================================
Test and train data frames are merged with what in SQL called 'UNION' type of merge, preserving same set of collumns and adding together rows.
==================================================================
Merged data frame is groupped by 'subj' and 'activity' variables with mean values for all variables using melt and dcast functions.
==================================================================
Resulting tidy dataset is written to 'tidy_ds.txt' file with write.table function.

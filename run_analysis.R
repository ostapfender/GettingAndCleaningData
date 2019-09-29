features <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

# test set
test_subj <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test_X <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_Y <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_body_x <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
test_body_y <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
test_body_z <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
test_total_x <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
test_total_y <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
test_total_z <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")
test_gyro_x <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
test_gyro_y <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
test_gyro_z <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")

# renaming
names(test_subj) <- "subj"
names(test_X) <- features$V2
names(test_body_x) <- gsub("V", "body_x_", names(test_body_x))
names(test_body_y) <- gsub("V", "body_y_", names(test_body_y))
names(test_body_z) <- gsub("V", "body_z_", names(test_body_z))
names(test_total_x) <- gsub("V", "total_x_", names(test_total_x))
names(test_total_y) <- gsub("V", "total_y_", names(test_total_y))
names(test_total_z) <- gsub("V", "total_z_", names(test_total_z))
names(test_gyro_x) <- gsub("V", "gyro_x_", names(test_gyro_x))
names(test_gyro_y) <- gsub("V", "gyro_y_", names(test_gyro_y))
names(test_gyro_z) <- gsub("V", "gyro_z_", names(test_gyro_z))

#joining subject and activity
test <- test_subj
test$activity <- merge(test_Y, activities)$V2

#set rownames
test$rownames <- rownames(test)

# get only mean() and std()
test_mean_std <- test_X[, grep("mean\\(\\)|std\\(\\)", names(test_X), value = TRUE)]
test_mean_std$rownames <- rownames(test_mean_std)

test_body_x$rownames <- rownames(test_body_x)
test_body_y$rownames <- rownames(test_body_y)
test_body_z$rownames <- rownames(test_body_z)
test_total_x$rownames <- rownames(test_total_x)
test_total_y$rownames <- rownames(test_total_y)
test_total_z$rownames <- rownames(test_total_z)
test_gyro_x$rownames <- rownames(test_gyro_x)
test_gyro_y$rownames <- rownames(test_gyro_y)
test_gyro_z$rownames <- rownames(test_gyro_z)

# join data frames
test_dfs <- list(test, test_mean_std, test_body_x, test_body_y, test_body_z, 
                 test_total_x, test_total_y, test_total_z, test_gyro_x, test_gyro_y, test_gyro_z)
test <- join_all(test_dfs)
#remove rownames column
test <- select(test, -rownames)

# train set
train_subj <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train_X <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_Y <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_body_x <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
train_body_y <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
train_body_z <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
train_total_x <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
train_total_y <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
train_total_z <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")
train_gyro_x <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
train_gyro_y <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
train_gyro_z <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")

# renaming
names(train_subj) <- "subj"
names(train_X) <- features$V2
names(train_body_x) <- gsub("V", "body_x_", names(train_body_x))
names(train_body_y) <- gsub("V", "body_y_", names(train_body_y))
names(train_body_z) <- gsub("V", "body_z_", names(train_body_z))
names(train_total_x) <- gsub("V", "total_x_", names(train_total_x))
names(train_total_y) <- gsub("V", "total_y_", names(train_total_y))
names(train_total_z) <- gsub("V", "total_z_", names(train_total_z))
names(train_gyro_x) <- gsub("V", "gyro_x_", names(train_gyro_x))
names(train_gyro_y) <- gsub("V", "gyro_y_", names(train_gyro_y))
names(train_gyro_z) <- gsub("V", "gyro_z_", names(train_gyro_z))

#joining subject and activity
train <- train_subj
train$activity <- merge(train_Y, activities)$V2

# get only mean() and std()
train$rownames <- rownames(train)
train_mean_std <- train_X[, grep("mean\\(\\)|std\\(\\)", names(train_X), value = TRUE)]
train_mean_std$rownames <- rownames(train_mean_std)
train_body_x$rownames <- rownames(train_body_x)
train_body_y$rownames <- rownames(train_body_y)
train_body_z$rownames <- rownames(train_body_z)
train_total_x$rownames <- rownames(train_total_x)
train_total_y$rownames <- rownames(train_total_y)
train_total_z$rownames <- rownames(train_total_z)
train_gyro_x$rownames <- rownames(train_gyro_x)
train_gyro_y$rownames <- rownames(train_gyro_y)
train_gyro_z$rownames <- rownames(train_gyro_z)

# join data frames
train_dfs <- list(train, train_mean_std, train_body_x, train_body_y, train_body_z, 
            train_total_x, train_total_y, train_total_z, train_gyro_x, train_gyro_y, train_gyro_z)
train <- join_all(train_dfs)
#remove rownames column
train <- select(train, -rownames)

#merge test and train
merged <- rbind(test, train)
mergedMelt <- melt(merged, id = c("activity", "subj"), 
                   measure.vars = c(names(merged)[which(names(merged) != "subj" & names(merged) != "activity")]))

#get tidt data set
tidy_ds <- dcast(mergedMelt, activity + subj ~ variable, mean)

#write tidy data set to file
write.table(tidy_ds, file = "tidy_ds.txt", row.names = FALSE)

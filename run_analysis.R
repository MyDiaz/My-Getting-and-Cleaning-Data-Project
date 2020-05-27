#library(read.table)

#read test and train data in X
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

#read test and train data in Y
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")


#merge Y and name it
y_total <- rbind(y_train, y_test)
colnames(y_total) <- c("activities")

#merge X
x_total <- rbind(x_train, x_test)


#read features and activities 
features <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

#read test and train data in subject
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
#merge subject and name it
subject_total <- rbind(subject_train, subject_test)
colnames(subject_total) <- c("subject")

#label x_total variables
features <- as.character(features[,2])
colnames(x_total) <- c(features)

#rewrite column names to comply with the convention
colnames(x_total) <- gsub("-mean[()]*-", "Mean", colnames(x_total))
colnames(x_total) <- gsub("-std[()]*-", "Std", colnames(x_total))

#Obtain the columns required
selCols <- grep("-(mean|std)", features)
x_total <- x_total[selCols]

#merge x, y and subject data
data_total <- cbind(x_total,y_total, subject_total)

#average of each variable for each activity and each subject.
data_total_2 <- aggregate(x = data_total, by = list(activities = data_total$activities , subject = data_total$subject), FUN = "mean")

#label each activity for each subject 
data_total_2$activities <- factor(data_total_2$activities, labels = activities[,2])

#obtain the tidy data set
write.table(data_total_2, "./tidy_dataset.txt", row.names = FALSE, quote = FALSE)









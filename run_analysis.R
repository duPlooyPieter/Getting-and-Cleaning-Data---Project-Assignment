library(dplyr)

features <- read.table("./data/UCI HAR Dataset/features.txt",header = FALSE)
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt",header = FALSE)


#train datasets
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt",header = FALSE)
y_train <- read.table("./data/UCI HAR Dataset/train/Y_train.txt",header = FALSE)
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",header = FALSE)

#test datasets
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt",header = FALSE)
y_test <- read.table("./data/UCI HAR Dataset/test/Y_test.txt",header = FALSE)
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt",header = FALSE)

# ________________________________________________________________________________________________
# 1. Merges the training and the test sets to create one data set.
# ________________________________________________________________________________________________

Subject_total <- rbind(subject_train, subject_test)
Y_total<- rbind(y_train, y_test)
X_total<- rbind(x_train, x_test)

names(Subject_total)<-c("subject")
names(Y_total)<- c("activity")
names(X_total)<- t(features[2])

dataCombine <- cbind(Subject_total, Y_total)
MergeData <- cbind(X_total, dataCombine)

# ________________________________________________________________________________________________
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# ________________________________________________________________________________________________
selected_var <- features$V2[grep("mean\\(\\)|std\\(\\)", features[,2])]
selected_var <- c(as.character(selected_var), "subject", "activity" )
Data<-subset(MergeData,select=selected_var)

# ________________________________________________________________________________________________
# 3. Uses descriptive activity names to name the activities in the data set
# ________________________________________________________________________________________________
Data$activity <- activity_labels[Data$activity, 2]

# ________________________________________________________________________________________________
# 4. Appropriately labels the data set with descriptive variable names.
# ________________________________________________________________________________________________
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

# ________________________________________________________________________________________________
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
#    each variable for each activity and each subject.
# ________________________________________________________________________________________________
TidyData <- Data %>% group_by(subject, activity) %>% summarise_all(funs(mean))

write.table(TidyData, "TidyData.txt", row.name=FALSE)



# Getting-and-Cleaning-Data-Week-4-Assignment

This repo was created for the Getting and Cleaning Data course project.
Follow these steps to get the average data of each variable for each activity and each subject:
1. Download and unzip the data files into your working directory. The zip file can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Download the R source code (run_analysis.R) into your working directory.
3. Execute the R source code to generate the TidyData.txt file.

### The code was written based on the assignment's instructions
Read training and test dataset into R.
Read variable names into R.
Read subject index into R.

1. Merges the training and the test sets to create one data set.
Use command rbind to combine training and test set
2. Extracts only the measurements on the mean and standard deviation for each measurement.
Use grep command to get column indexes for variable name contains "mean()" or "std()"
3. Uses descriptive activity names to name the activities in the data set
Convert activity labels to characters and add a new column as factor
4. Appropriately labels the data set with descriptive variable names.
Give the selected descriptive names to variable columns
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Use pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package

### Code Explaination
The code reads and merges the training and the test sets foreach subject, feature and activity before creating on data set called MergeData. Then extracts only the measurements on the mean and standard deviation for each measurement accordingly to the features.txt file
before creating a tidy dat ith the average of each variable for each activity and each subject.

### Data Description
The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording.

### TidyData Dataset
The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.


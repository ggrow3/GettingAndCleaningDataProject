
#Coursera Getting and Cleaning Data Project -

#Purpose 
The purpose of this project is to serve as a tutorial to learn how to clean, merge, and apply functions such as mean and standard deviation to datasets. The demo data is activity data collected from a Samsung smart phone.
The code should have a file run_analysis.R in the main directory that can be run as long as the Samsung data is in your working directory.


# Steps To Get Run
Download http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Put run_analysis.r in the working directory of the UCI HAR DataSet.
Open up a R Studio or an r prompty Type source("run_analysis.r")

run_analysis functions
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Steps to work on this course project

Download the data source and put into a folder on your local drive. You'll have a UCI HAR Dataset folder.
Put run_analysis.R in the parent folder of UCI HAR Dataset, then set it as your working directory using setwd() function in RStudio.
Run source("run_analysis.R"), then it will generate a new file tiny_data.txt in your working directory.
Dependencies

run_analysis.R file will help you to install the dependencies automatically. It depends on reshape2 and data.table.

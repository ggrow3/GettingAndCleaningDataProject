if (!require("util")) {
  install.packages("util")
}
require("util")

#Download Zip File
download.zipFile <- function (fileName="dataset.zip") {
  url <- 'http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  download.file(url, destfile = fileName, method = 'curl')
  unzip(zip.file)
}

# 1. Merges the training and the test sets to create one data set.
x.set <- rbind( read.table("train/X_train.txt"), read.table("test/X_test.txt"))
subject.set <- rbind(read.table("train/subject_train.txt"), read.table("test/subject_test.txt"))
activity.set <- rbind(read.table("train/y_train.txt"), read.table("test/y_test.txt"))

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("features.txt")
usedFeatures <- grep("-mean\\(\\)|-std\\(\\)",features[,2])
x.set <- x.set[,usedFeatures]
names(x.set) <- tolower(features[usedFeatures, 2])
names(x.set) <- gsub("\\(|\\)","",names(x.set))
names(x.set) <- gsub("^t","time",names(x.set))
names(x.set) <- gsub("^f","freq",names(x.set))
names(x.set) <- gsub("BodyBody","Body",names(x.set))


# 3. Uses descriptive activity names to name the activities in the data set
names(activity.set) <- "activity"
activity <- read.table("activity_labels.txt")
activity[, 2] = gsub("_", "-", tolower(as.character(activity[, 2])))
activity.set[,1] = activity[activity.set[,1],2]

# 4. Appropriately labels the data set with descriptive activity names. 
names(subject.set) <- "subject"
tidyData<- cbind(subject.set, activity.set, x.set)
write.table(tidyData, "TidyData.txt", row.names=FALSE)

# 5. Creates a second, independent tidyData set with the average of each variable for each activity and each subject. 
numActivities <- nrow(activity)
numCols <- dim(tidyData)[2]
uniqueSubjects <- unique(subject.set)[,1]
numSubjects <- length(uniqueSubjects)

tidyData.avg <- tidyData[1:(numSubjects*numActivities), ]

row = 1
for (sub in 1:numSubjects) {
  for (act in 1:numActivities) {
    tidyData.avg[row, 1] = uniqueSubjects[sub]
    tidyData.avg[row, 2] = activity[act, 2]
    indexes <- tidyData[tidyData$subject==sub & tidyData$activity==activity[act, 2], ]
    tidyData.avg[row, 3:numCols] <- colMeans(indexes[, 3:numCols])
    row = row+1
  }
}
write.table(tidyData.avg, "TidyDataAvg.txt", row.names=FALSE)
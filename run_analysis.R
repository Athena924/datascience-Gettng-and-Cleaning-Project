if(!file.exists("./data")){dir.create('./data')}
fileurl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# 1.1.2 Reading testing tables:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# 1.1.3 Reading feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# 1.1.4 Reading activity labels:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')
# 3 Uses descriptive activity names to name the activities in the data set
colnames(x_train)<-features[,2]
colnames(y_train)<-"activityId"
colnames(subject_train)<-"subjectId"
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
#4 Appropriately labels the data set with descriptive variable names.
colnames(activityLabels) <- c('activityId','activityType')
mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
allinone <- rbind(mrg_train, mrg_test)
dim(allinone)
# Extracts only the measurements on the mean and standard deviation for each measurement. 
colNames<-colnames(allinone)
mean_and_std<-(grepl("activityId",colNames)|grepl("subjectId",colNames)|grepl("mean..",colNames)|grepl("std..",colNames))
setformeanandstd<-allinone[, mean_and_std==TRUE]
setwthactivitynames <- merge(setformeanandstd, activityLabels,
                              by='activityId',
                              all.x=TRUE)
#5 creates a second, independent tidy data set with the average of each variable for each activity and each subject.
secTidySet <- aggregate(. ~subjectId + activityId, setwthactivitynames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]
write.table(secTidySet, "secTidySet.txt", row.name=FALSE)
secTidySet



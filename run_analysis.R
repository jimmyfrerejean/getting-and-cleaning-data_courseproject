#Read data
features <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
activityLabels <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

training1 <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
training2 <- read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
trainingSubj <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

#Set column names
colnames(activityLabels) = c("activityId","activityType");
colnames(trainingSubj) = "subjectId";
colnames(training1) = features[,2];
colnames(training2) = "activityId";

#Merge training data
training <- cbind(training1, training2, trainingSubj)

#Read testing data
testing1 <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
testing2 <- read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
testingSubj <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

#Set column names
colnames(testingSubj) = "subjectId";
colnames(testing1) = features[,2];
colnames(testing2) = "activityId";

#Merge testing data
testing <- cbind(testing1, testing2, testingSubj)

#Merge both datasets
dataset <- rbind(training, testing)

#Only select columns means and sd's
colNames  = colnames(dataset);
datasetMeanStd <- dataset[, (grepl("activity..",colNames) |
														 	grepl("subject..",colNames) |
														 	grepl("-mean..",colNames) &
														 	!grepl("-meanFreq..",colNames) &
														 	!grepl("mean..-",colNames) |
														 	grepl("-std..",colNames) &
														 	!grepl("-std()..-",colNames))]

#Replace activity levels with text
datasetMeanStd$activityId[datasetMeanStd$activityId == 1] <- "Walking"
datasetMeanStd$activityId[datasetMeanStd$activityId == 2] <- "Walking upstairs"
datasetMeanStd$activityId[datasetMeanStd$activityId == 3] <- "Walking downstairs"
datasetMeanStd$activityId[datasetMeanStd$activityId == 4] <- "Sitting"
datasetMeanStd$activityId[datasetMeanStd$activityId == 5] <- "Standing"
datasetMeanStd$activityId[datasetMeanStd$activityId == 6] <- "Laying"

#Replace variable names/columns with better text
colNames = colnames(datasetMeanStd)
for (i in 1:length(colNames)) {
		colNames[i] = gsub("\\()","",colNames[i])
		colNames[i] = gsub("-std$","StdDev",colNames[i])
		colNames[i] = gsub("-mean","Mean",colNames[i])
		colNames[i] = gsub("^(t)","time",colNames[i])
		colNames[i] = gsub("^(f)","freq",colNames[i])
		colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
		colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
		colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
		colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
		colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
		colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
		colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
}
colnames(datasetMeanStd) = colNames

#Create tidy dataset
library(data.table)
tidyDataset <- data.table(datasetMeanStd)
tidyDataset <- tidyDataset[,lapply(tidyDataset,mean),by="activityId,subjectId"]
tidyDataset[,22] <- NULL
tidyDataset[,21] <- NULL

#Export tidy dataset
write.table(tidyDataset, "tidyDataset.txt", row.names=FALSE, sep="\t");

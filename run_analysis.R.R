## Downloading and unzipping the file :
if(!file.exists("./Data")){dir.create("./Data")}
> fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
> download.file(fileUrl,destfile="./Data/Dataset.zip",method="curl")
## Unzipping the file
## The file should unzip into a folder named UCI HAR Dataset where all the unzipped files are located.
unzip(zipfile = "./Data/Dataset.zip", exdir = "./Data")


## Reading each data set:
# Reading the Training set:
XTrain <- read.table("./Data/UCI HAR Dataset/train/X_train.txt")
YTrain <- read.table("./Data/UCI HAR Dataset/train/Y_train.txt")
SubTrain <- read.table("./Data/UCI HAR Dataset/train/subject_train.txt")


# Reading the Test data:
XTest <- read.table("./Data/UCI HAR Dataset/test/X_test.txt")
YTest <- read.table("./Data/UCI HAR Dataset/Test/Y_test.txt")
SubTest <- read.table("./Data/UCI HAR Dataset/test/subject_test.txt")

#Reading the feature variables:
features <- read.table("./Data/UCI HAR Dataset/features.txt")

#Reading the activity labels:
ActLabels <- read.table("./Data/UCI HAR Dataset/activity_labels.txt")

##Tidying the data by assigning the column names:
colnames(XTrain) <- features[,2]
colnames(YTrain) <- "activityId"
colnames(SubTrain) <- "subjectId"

colnames(XTest) <- features[,2]
colnames(YTest) <- "activityId"
colnames(SubTest) <- "subjectId"

colnames(ActLabels) <- c("activityId", "activityType")

## Merging the data together
MrgTrain <- cbind(YTrain,SubTrain,XTrain)
MrgTest <- cbind(YTest,SubTest,XTest)
MrgAll <- rbind(MrgTrain,MrgTest)

## Extracting only the Mean and the Standard deviation variables

colNames <- colnames(MrgAll)
MeanAndStd <- (grepl("activityId",colNames)|grepl("subjectId",colNames)|
                 grepl("mean..",colNames)|grepl("std..",colNames)
               )
Mean_And_Std <- MrgAll[ , MeanAndStd ==TRUE]

##Describing the Activity Names
Mean_And_StdNames <- merge(Mean_And_Std, ActLabels, by = "activityId", all.x = TRUE)

## Creating the Tidy Data Set:
TidySet <- aggregate(.~subjectId+activityId,Mean_And_StdNames,mean)
NewTidySet <- TidySet[order(TidySet$subjectId, TidySet$activityId), ]

##Writing the Tidy data set in a text file.
write.table(NewTidySet, "NewTidySet.txt",row.names = FALSE)






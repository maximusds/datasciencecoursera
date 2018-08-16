library(dplyr)

#Directory files
dir <- "UCI HAR Dataset"

#Read all the files with data
xtest <- read.table(paste(dir,"test/X_test.txt"))
ytest <- read.table(paste(dir,"test/y_test.txt"))
subjecttest <- read.table(paste(dir,"test/subject_test.txt"))
xtrain <- read.table(paste(dir,"train/X_train.txt"))
ytrain <- read.table(paste(dir,"train/y_train.txt"))
subjecttrain <- read.table(paste(dir,"train/subject_train.txt"))
features <- read.table(paste(dir,"features.txt"))
labels <- read.table(paste(dir,"activity_labels.txt"))

#Merge the train with the test sets
traindata <- cbind(subjecttrain, ytrain, xtrain)
testdata <- cbind(subjecttest, ytest, xtest)
totaldata <- rbind(testdata, traindata)
colnames(totaldata) <- c("subject", "activity", features[, 2])

#Measurements on the mean and standard deviation

selection<-select(matches("mean|std"),one_of("subject","activity"))

data <- totaldata[, selection]

#Uses descriptive activity names 
data[, 2] <- as.factor(data[, 2])
levels(data[, 2]) <- tolower(labels[, 2])

colnames(data) <- gsub("[^a-zA-Z\\d_]", "", colnames)
data <- tbl_df(data)
data <- group_by(data, subject, activity)
tidy_data <- summarize_all(data, mean)

#Final results  in tidy_data.txt
write.table(tidy_data, file = "tidy_dataset.txt", row.names = FALSE)

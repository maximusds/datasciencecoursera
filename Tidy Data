## Load the dependencies

library("dplyr")
library("reshape2")

## The main data directory

dir <- "UCI HAR Dataset"

## Loads a file

load_file <- function(filename, ...) {
  file.path(..., filename) %>%
  read.table(header = FALSE)
}

## Loads a training file

load_train_file <- function(filename) {
  load_file(filename, dir, "train")
}

## Loads a test file

load_test_file <- function(filename) {
  load_file(filename, dir, "test")
}

## Uses list of activity values d4escribing the test or training labels

describe_lbl_ds <- function(ds) {
  names(ds) <- activity_col  
  ds$Activity <- factor(ds$Activity, levels = activity_lbl$V1, labels = activity_lbl$V2)
  ds
}

## Takes a dataset capturing results of feature tests and associates columns with individual features

describe_act_ds <- function(ds) {
  col_names <- gsub("-", "_", features$V2)
  col_names <- gsub("[^a-zA-Z\\d_]", "", col_names)
  names(ds) <- make.names(names = col_names, unique = TRUE, allow_ = TRUE)
  ds
}

## Adjusts column name in the data set identifying test participants

describe_sub_ds <- function(ds) {
  names(ds) <- subject_col
  ds
}
}

## Columns

subject_col <- "Subject"
activity_col <- "Activity"

## Load features 

features <- load_file("features.txt", dir)

## Load activity labels

activity_lbl <- load_file("activity_labels.txt", dir)

## Use descriptive activity names to name the activities in the data set

train_set <- load_train_file("X_train.txt") %>% describe_act_ds
train_lbl <- load_train_file("y_train.txt") %>% describe_lbl_ds
train_sub <- load_train_file("subject_train.txt") %>% describe_sub_ds
test_set <- load_test_file("X_test.txt") %>% describe_act_ds
test_lbl <- load_test_file("y_test.txt") %>% describe_lbl_ds
test_sub <- load_test_file("subject_test.txt") %>% describe_sub_ds

## Merge the training and the test sets to create one dataset

merge_data <- rbind(
                cbind(train_set, train_lbl, train_sub),
                cbind(test_set, test_lbl, test_sub)
              ) %>%
              select(
                matches("mean|std"), 
                one_of(subject_col, activity_col)
              )

## Create a second, independent tidy data set with the average of each variable for each activity and each subject

id_cols <- c(subject_col, activity_col)
tidy_data <- melt(
               merge_data, 
               id = id_cols, 
               measure.vars = setdiff(colnames(merge_data), id_cols)
             ) %>%
             dcast(Subject + Activity ~ variable, mean)
             
## Save the result
write.table(tidy_data, file = "tidy_data.txt", sep = ",", row.names = FALSE)


## Variable_description
* xtrain: Training set data a numeric vector
* ytrain: Activity_labels
* subjecttrain: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* xtest: Test set data, each colunm is a numeric vector, the values are normalized and bounded within [-1,1]
* ytest: Test labels correspond to activity_labels, values are intger between 1 and 6.
* subjecttest: Similar to subject_train.
* features. The first colunm are the indexes(integer) and the second are the feature names(character).
* activity_labels: A (6,2) data fram. The second colunm contains the activity names(character) and the first colunm is their correspond number(integer).
* tidy_dataset: The final data we need.
* traindata: Merging the train sets.
* testdata: Merging the tests sets.
* totaldata: Merging traindata with totaldata.
* data: dataset with the measurements mean and std

## Code process
* Read data files we need.
* Merge the training and testing data sets.
* Extract the subset we need.
* Rename each colunm by the features. Change the labels by the activities name.
* Split the data into groups by subject and activity, then apply the mean function on all groups the get the final data.

## Tidy_data_description
The tidy data contains 180 rows and 68 columns. Each row has averaged variables grouped by subject and activity. 

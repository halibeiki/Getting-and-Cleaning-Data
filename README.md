# Getting-and-Cleaning-Data

In this Repo, I have put an R script called __run_analysis.R__ that merges two data sets and prepare them for the analysis in the following order:  

1- It merges a so-called training set and a test set to create one data set,
2- Then extracts only the measurements on the mean and standard deviation for each measurement (only those variables that are mean or stdev of other variables), 
3- Then, uses descriptive activity names to name the activities in the data set which are originally saved as numbers,
4- Next, it labels the data set with descriptive variable names (which was already done in step 2 as well), 
5- And finally, from the data set in step 4, it creates a second, independent tidy data set with the average of each variable for each instance of activity-subject (in this specific problem we have 180 instances= 30 subjects X 6 activities).

__bold__ I have 

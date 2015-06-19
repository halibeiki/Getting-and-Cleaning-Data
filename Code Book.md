In this Code Book, we first briefly define the used data sets in this project and then focus on the __run_analysis.R__ file and explain different steps of our cleaning the data in more detail.

===========================================
__Data sets__: The whole data sets come from expriments of Human Activity Recognition Using Smartphones Dataset, which have been carried out with a group of 30 volunteers where each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) which are characterized as 1,2,...,6 in the raw data sets. These are the data sets that we 
- Test and Train: these two data sets are the original raw data sets that need to be cleaned. Both include 561 variables plus the subject and the activity that has been done, a total of 563 variables. Test includes 2947 and Train 7352 observations. 
- Merged: this data set is created by merging two raw sets of Test and Train with a total number of observations of 10299. Some other tasks have been done to increase readability of this data set as explained later in this Code Book. 
- Tidy: this data set includes the average (mean) of all 561 variables for each instance of subject-activity (180 total number of observations).

__Steps in preparing the data sets__


# Code Book
In this Code Book, we first briefly define the used data sets in this project and then focus on the __run_analysis.R__ file and explain different steps of our cleaning the data in more detail.

===========================================
## Data sets 
The whole data sets come from expriments of Human Activity Recognition Using Smartphones Dataset, which have been carried out with a group of 30 volunteers where each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) which are characterized as 1,2,...,6 in the raw data sets. Below is the list of both input and output data sets.

* _Test and Train_: these two data sets are the original raw data sets that need to be cleaned. Both include 561 variables plus the subject and the activity that has been done, a total of 563 variables. Test includes 2947 and Train 7352 observations. 
* _Merged_: this data set is created by merging two raw sets of Test and Train with a total number of observations of 10299. Some other tasks have been done to increase readability of this data set as explained later in this Code Book. 
* _Tidy_: this data set includes the average (mean) of all 561 variables for each instance of subject-activity (180 total number of observations).

========================================
## Steps in preparing the data sets

Below, we explain how the code in __run_analysis.R__ will lead from _Test and Train_ to _Merged_ and _Tidy_ . 
* STEP 1: Merge the training and the test sets to create one data set; 
  * First, we created two data.frames [x,subject,y] from test and train datasets using read.table and cbind functions
  * Next, we merged them simply using rbind function
* STEP 2: Extract only the measurements on the mean and standard deviation 
  * First, we read the names of features using read.table from the file "features.txt"
  * Second, we set the name of different features and also added "activity" for y and "subject" for z variables using names()
  * Third, we only need to subset over the variables that contain the MEAN() or STD(), we use grep() to find them
* STEP 3: Using descriptive activity names to name the activities in the data set
  * First, we read the names of activities from "activity_labels.txt" using read.table()
  * Then, in a loop, we find all the values of activities (a number from 1 to 6) and replace it with actual name of the activity using gsub() function.
* STEP 4: Appropriately labeling the data set with descriptive variable names
  * We already have done it in the first two bullets of step 2. we can alos change the name of variables slightly and make it different from what actually is present in the "features.txt" file. 
* STEP 5- Creating a new Tidy Data Set: 
  * First, using aggregate() function we calculate the mean of variables for different groups based on subject and activity
  * Second, we save the new tidy data which contains all tha features with names in a separate file using write.table() function.

The output of step 4 is the cleaned and clarified data set for further analysis which contains all the data from Test and Train. 
The output of step 5 is even more precise and has some pre-analysis inside as it captures the mean of each variable for each pair of (subject, activity); for instance we have the average of all the values that are measured for a specific activity of a specific subject. 



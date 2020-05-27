# Getting and Cleaning Data Course Project
### Description
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data was collected from the accelerometers from the Samsung Galaxy S smartphone. 

### Scripts

  - run_analysis.R
     This scripts performs all the tasks needed to generate the tidy data set required in the assignment.
1. Read the train and test data and merge in x, y and subject
2. Read the activities and features data.
3. Label the y and subject data 
2. Label the x data set with the features names and rewrite column names to comply with the convention. 
3. Extract the columns required in x data.
4. Merge the x, y and subject data in one data set called data_total
5. From the data_total, creates a second data set called data_total_2, independent tidy data set with the average of each variable for each activity and each subject.
6. Label each activity for each subject

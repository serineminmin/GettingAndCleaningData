# GettingAndCleaningData
Coursera Week 4 Assignment submission

The code will first download the dataset from UCI Machine Learning Repository. Further details on the study and data set description can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset is currently split into Training and Test datasets in different folder. 
Therefore the purpose of this run_analysis.R script in this repository is to:
1) first merge and create a consolidated dataset convenient for running analysis
2) for each feature collected, we are currently interested in the variables: mean and standard deviation
  (For full understanding on what features are collected, you can refer to features_info.txt in the download folder.)
3) ensure each column is labelled appropriately and descriptively

An additional tidy dataset is created to compute the average of each variable for each activity and each subject.

Thanks for reading.

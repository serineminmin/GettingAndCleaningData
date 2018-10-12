# GettingAndCleaningData
Coursera Week 4 Assignment submission

The code will first download the dataset from UCI Machine Learning Repository. Further details on the study and data set description can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset is currently split into Training and Test datasets in different folder. 
Therefore the purpose of this run_analysis.R script in this repository is to:
1) first merge and create a consolidated dataset convenient for running analysis
2) for each feature collected, we are currently interested in the variables: mean and standard deviation
3) ensure each column is labelled appropriately and descriptively

An additional tidy dataset is created to compute the average of each variable for each activity and each subject.

  The dataset includes the following files:
  =========================================

  - 'README.txt'

  - 'features_info.txt': Shows information about the variables used on the feature vector.

  - 'features.txt': List of all features.

  - 'activity_labels.txt': Links the class labels with their activity name.

  - 'train/X_train.txt': Training set.

  - 'train/y_train.txt': Training labels.

  - 'test/X_test.txt': Test set.

  - 'test/y_test.txt': Test labels.


For detailed steps of the script, you can refer to the comments within.

Thanks for your time.

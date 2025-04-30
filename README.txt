Introduction
This project is the final assignment for the "Getting and Cleaning Data" course on Coursera.
It demonstrates the ability to collect, clean, and produce a tidy data set that can be used for later analysis.

Files Included
run_analysis.R: Script that downloads, reads, merges, processes, and outputs the tidy dataset.
CodeBook.md: A code book that describes each variable, the data, and the transformations applied.
tidy_data.txt: Final tidy dataset containing the average of each variable for each activity and each subject.
README.md: This file, describing the project structure and logic.
Project Summary
The script run_analysis.R:

Downloads and unzips the dataset.
Merges the training and test datasets into a single dataset.
Extracts measurements related to the mean and standard deviation.
Replaces activity codes with descriptive activity names.
Labels the dataset with descriptive variable names.
Creates a second tidy dataset with the average of each variable for each activity and each subject.
Writes the tidy data set to tidy_data.txt.
Data Source
Human Activity Recognition Using Smartphones

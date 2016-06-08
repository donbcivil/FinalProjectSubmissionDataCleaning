# README for Final project: Getting and Cleaning Data class
### Author: Don Baldwin
### Date: 6/7/2016

### To view this file, open in RStudio and press the "Preview HTML" button"

### Files included:
* README.MD - this file
* codebook.md - tidy data description
* tidymerged.csv - tidy data set in standard CSV format
* run_analysis.R - project scripts

## Environmental assumptions. 
* RStudio for running code and viewing .MD files. 
* reshape2 library installed
* Project input data extracted from zip file and directories maintained
    + UCI HAR Dataset - base dir
    +   UCI HAR Dataset/test - test set 
    +   UCI HAR Dataset/train - training set
    +   UCI HAR Dataset/final - directory created for saving interim and final data

### Run analysis includes the following functions:
* RunAnalysis <- function(basedir) - runs CreateProcessedRaw and CreateTidyData to do initial processing and create the tidy data

* CreateProcessedRaw( basedir ) - does initial processing, produces input file for CreateTidyData
    
* CreateTidyData( basedir ) - uses file from CreateProcessedRaw to produce tidy data set

* ChangeLabel( instr ) - utility function used in sapply() calls to split leading numbers from labels

* CreateCSVVersion( infile, outfile ) - utility function takes a large, unwieldy fixed width file and generates a CSV file from it for much faster loading and less memory use.
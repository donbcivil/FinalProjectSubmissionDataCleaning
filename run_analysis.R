# Final project: Getting and Cleaning Data class
# Author: Don Baldwin
# Date: 6/7/2016
#
# Either call RunAnalysis( basedir ) (which calls both CreateProcessedRaw( basedir ) and 
# CreateProcesedRaw( basedir ) or call them separately and in that order.)
#
#  For example:
#   RunAnalysis( "C:\\Data Study\\Class 3 Getting Cleaning Data\\Final Project\\UCI HAR Dataset" )
#
#  Or:
#   1) CreateProcessedRaw( "C:\\Data Study\\Class 3 Getting Cleaning Data\\Final Project\\UCI HAR Dataset" )
#   2) CreateTidyData( "C:\\Data Study\\Class 3 Getting Cleaning Data\\Final Project\\UCI HAR Dataset" )
#
#      N.B. CreateProcessedRaw creates a CSV file used as input by CreateTidyData and must be called first.
#
# Pass in base directory of starting data set. This assumes that
# relative directory paths and file placement were maintained when 
# unzippping project data:
#   BASE/test
#   BASE/test/Inertial Signals
#   BASE/train
#   BASE/train/Inertial Signals
RunAnalysis <- function(basedir)
{
    # Create a more readily useful collated CSV data set from the appropriate files
    CreateProcessedRaw( basedir )
    
    # Use that CSV file to generate the tidy data file
    CreateTidyData( basedir )
}

# Read in raw data files
# Files output:
#   UCI HAR Dataset\\final\\merged.csv - cleaned up and collated data
#   UCI HAR Dataset\\final\\tidymerged.csv - final tidy data set

#   UCI HAR Dataset\\final\\x_test.csv - interim file created from LARGE input file for faster access
#   UCI HAR Dataset\\final\\x_test.csv - interim file created from LARGE input file for faster access
CreateProcessedRaw <- function(basedir)
{
    # This effectively ensures that the base directory exists
    setwd(basedir)
    
    # Load feature names
    infile = "features.txt"
    rawdata = readChar( infile, file.info( infile )$size )
    features = unlist( as.vector( strsplit( rawdata,"\n" ) ) )
    
    # Now get rid of the leading number - will look dumb when we filter columns or reorder because of gaps
    features = unname( sapply( features, ChangeLabel) )
    featuresSorted = sort(features)
    
    # Load activity labels
    infile = "activity_labels.txt"
    rawdata = readChar( infile, file.info( infile )$size )
    activitylabels = unlist( as.vector( strsplit( rawdata,"\n" ) ) )
    activitylabels  =unname(sapply(activitylabels, ChangeLabel))
    
    ############################### TEST DATA ###############################
    # Load test activity info
    infile = "test/y_test.txt"
    rawdata = readChar( infile, file.info(infile)$size )
    activitydata = unlist( strsplit( rawdata, "\n" ) )
    
    # Load test subject info
    infile = "test/subject_test.txt"
    rawdata = readChar( infile, file.info( infile )$size )
    subjectdata = unlist( strsplit( rawdata,"\n") )
    
    # The x_test.txt and x_train.txt are fixed width files but loading them directly
    # in that format was ridiculously slow and memory intensive. Reformat as CSV
    # to make things run better
    CreateCSVVersion( "test/x_test.txt", "final/x_test.csv" )
    xtest = read.csv( "final/X_test.csv", header = FALSE, check.names = FALSE )
    
    # Set feature names in data, sort by column names for easy visual searching
    xtest = setNames(xtest,features)
    xtest = xtest[featuresSorted]
    
    # Add the basic activity and subject data
    xtest = cbind( xtest, activitydata )
    xtest = cbind( xtest, subjectdata )
    
    # This is a field I added just in case inspection of raw data is necessary
    xtest$dataset = "Test"
    
    #Reorder columns to the added columns are at the start
    xtest = xtest[ c(563,562,564,1:561) ]
    
    ############################### TRAIN DATA ###############################
    # Load test activity info
    infile = "train/y_train.txt"
    rawdata = readChar( infile, file.info(infile)$size )
    activitydata = unlist( strsplit( rawdata, "\n" ) )
    
    # Load test subject info
    infile = "train/subject_train.txt"
    rawdata = readChar( infile, file.info( infile )$size )
    subjectdata = unlist( strsplit( rawdata,"\n") )
    
    # The x_test.txt and x_train.txt are fixed width files but loading them directly
    # in that format was ridiculously slow and memory intensive. Reformat as CSV
    # to make things run better
    CreateCSVVersion( "train/x_train.txt", "final/x_train.csv" )
    xtrain = read.csv( "final/X_train.csv", header = FALSE, check.names = FALSE )

    # Set feature names in data, sort by column names for easy visual searching
    xtrain = setNames( xtrain, features )
    xtrain = xtrain[featuresSorted]
    
    # Add the basic activity and subject data
    xtrain = cbind( xtrain, activitydata )
    xtrain = cbind( xtrain, subjectdata )
    
    # This is a field I added just in case inspection of raw data is necessary
    xtrain$dataset = "Train"
    
    #Reorder columns
    xtrain = xtrain[ c(563,562,564,1:561) ]

    # Now combine the Test and Train datasets    
    merged = rbind(xtest,xtrain)

    # Set ameaningful ctivity names
    merged$activitydata = activitylabels[as.integer(merged$activitydata)]

    # Only save new data set, activity, subject and mean/std columns    
    colnames = names(merged)
    merged = merged[grepl("dataset|activitydata|subjectdata|[Mm]ean|std", names(merged))] 
        
    # Write CSV, suppressing the ID column which we don't need
    write.csv(merged,"final/merged.csv",row.names = FALSE)
}

# Takes input from CreateProcessedRaw and generates final tidy data
CreateTidyData <- function(basedir)
{
    # This effectively ensures that the base directory exists
    setwd(basedir)
    
    library(reshape2)

    # Load the clean raw data    
    cleanraw = read.csv( "final/merged.csv",check.names = FALSE )

    # Melt it and recast with aggregate mean function
    melted = melt(cleanraw, id.vars=c("subjectdata", "activitydata","dataset"))
    tidy = dcast(melted, subjectdata + activitydata + dataset ~ variable,fun.aggregate = mean)
    
    # Write final tidy data file
    #write.csv(tidy,"final/tidymerged.csv",row.names = FALSE)
    write.table(tidy,"final/tidymerged.txt",row.name = FALSE )
}



# Utility function returns second half of a string with a space embedded in it.
# Gets rid of leading numbers on data headers.
ChangeLabel <- function( instr )
{
    splitret = unlist( strsplit( instr, c(" ") ) )
    splitret[2]
}

# Utility function converts a fixed width file for this project into CSV
CreateCSVVersion <- function( infile, outfile )
{
    # Read in a file in one simple text chunk. The largest files are
    # fixed width files but take forever to load. We're going to
    # start by making them faster loading CSV 
    indata = readChar( infile, file.info(infile)$size )
    
    # Put an identifier at the start of line one se we can eliminate
    # leading spaces. Start eliminating all leading spaces on new lines
    indata = paste( "START", gsub("\r\n  ","\r\n",indata ))
    indata = gsub( "\r\n ", "\r\n", indata )

    # Now eliminate first leading spaces
    indata = sub( "START   ","", indata )
    indata = sub( "START  ","", indata )

    # Finally, reduce double spaces between observates to single spaces
    # and replace with commas.
    indata = gsub( "  ", " ", indata )
    indata = gsub( " ", ",", indata )
    writeChar( indata, sub( ".txt", ".csv", outfile ))
}





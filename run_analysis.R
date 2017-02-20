#1.0 Merge training and test data

      #1.1 Download Zip File and unzip

            if(!file.exists("./data")){dir.create("./data")}
      
            fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      
            download.file(fileUrl, destfile = "./data/Dataset.zip")
                    
            unzip(zipfile = "./data/Dataset.zip" ,exdir = "./data")
                    
      #1.2 Reading in training tables
                    
            xTrain <- read.table("./data/UCI HAR Dataset/train/x_train.txt")
            
            yTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
                    
            subjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
                    
      #1.3 Reading in test tables
                    
            xTest <- read.table("./data/UCI HAR Dataset/test/x_test.txt")
                   
            yTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
                    
            subjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
                    
      #1.4 Reading in features and activity labels
                    
            features <- read.table("./data/UCI HAR Dataset/features.txt")
                    
            activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
                    
      #1.5 Assign column names
                    
            colnames(xTrain) <- features[,2]
                  
            colnames(yTrain) <- "activityId"
      
            colnames(subjectTrain) < "subjectId"
            
            colnames(xTest) <- features[,2]
                    
            colnames(yTest) <- "activityId"
                    
            colnames(subjectTest) <- "subjectId"
                    
            colnames(activityLabels) <- c('activityId','activityType')
                    
      #1.6 Merge datasets into one
                    
            mergeTrain <- cbind(yTrain,subjectTrain,xTrain)
                    
            mergeTest <- cbind(yTest, subjectTest, xTest)
                   
            mergeAll <- rbind(mergeTrain, mergeTest)
              
#2.0 Extract measurements on the mean and standard deviation for each measurement
      
      #2.1 Extract column names
            
            columnNames <- colnames(mergeAll)
              

      #2.2 Create vector to find columns with mean and std
              
            meanStd <- (grepl("activityId", columnNames) | 
                              grepl("subjectId", columnNames) |
                              grepl("mean..", columnNames) |
                              grepl("std..", columnNames))
              
      #2.3 Subset data with only mean, std using vector defined above
              
            subsetMeanStd <- mergeAll[ , meanStd == TRUE]

#3.0 Use descriptive activity names to name the activity in the data set 
              
      #3.1 Merge subset data with activity labels 
                  
            subsetActivityNames <- merge(subsetMeanStd,activityLabels, by = 'activityId', all.x = TRUE)
              
#4.0 Appropriate label the data set with descriptive variable names
            
      #4.1 Replace abbreviations with descriptive labels for time, frequency, accelerator, gyroscope and magnitude
            
              names(subsetActivityNames) <- gsub("^t","time",names(subsetActivityNames))
              
              names(subsetActivityNames) <- gsub("^f","frequency",names(subsetActivityNames))
              
              names(subsetActivityNames) <- gsub("Acc","Accelerator",names(subsetActivityNames))
              
              names(subsetActivityNames) <- gsub("Gyro","Gyroscope",names(subsetActivityNames))
              
              names(subsetActivityNames) <- gsub("Mag","Magnitude",names(subsetActivityNames))
              
#5.0 Create a second, independent tidy dataset with the average of each variable for each activity and each subject
             
      #5.1 Output tidy data aggregated by activity and subject for the mean
              
              tidyData <- aggregate(. ~activityId + subjectId, subsetActivityNames, mean)
              
      #5.2 Write out final data text file
              
              write.table(tidyData,"TidyData.txt", row.names = FALSE)
              
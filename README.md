# Step 1 Reading and merging data
    setwd("C:/Sailaja_Projects/Personal/Training/Data Science Orientation/Data Science_Course 3/UCI HAR Dataset/train")
    > read_subject_train<-("subject_train.txt")
    > read_Xtrain<-("X.train.txt")
    > read_Ytrain<-("Y.train.txt")
    > setwd("C:/Sailaja_Projects/Personal/Training/Data Science Orientation/Data Science_Course 3/UCI HAR Dataset/test")
    > read_subject_test("subject_test.txt")
    > read_subject_test<-("subject_test.txt")
    > read_Xtest<-("X.test.txt")
    > read_Ytest<-("Y.test.txt")
    > names(read_subject_train)<-"subjectfile"
    > names(read_subject_test)<-"subjectfile"
    >featureNames <- read.table("features.txt")
    subject <- rbind(read_subject_train, read_subject_test)
   >XTestTrain<-rbind(read_Xtest,read_Xtrain)
    >YTestTrain<-rbind(read_Ytest,read_Ytrain)
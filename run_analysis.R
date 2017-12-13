library("dplyr")

##Step 1

#read all files
subtest  <- read.table("data/UCI HAR Dataset/test/subject_test.txt", col.names="X0")
subtrain <- read.table("data/UCI HAR Dataset/train/subject_train.txt", col.names="X0")
ytest  <- read.table("data/UCI HAR Dataset/test/y_test.txt", col.names="X1")
ytrain <- read.table("data/UCI HAR Dataset/train/y_train.txt", col.names="X1")
xtest  <- read.table("data/UCI HAR Dataset/test/X_test.txt")
xtrain <- read.table("data/UCI HAR Dataset/train/X_train.txt")

#combine into one set
oneset <- cbind(rbind(subtest,subtrain),rbind(ytest,ytrain),rbind(xtest,xtrain)) %>%
  arrange(X0)

##Step 2

#extract the 561 features as a vector
features <- scan("data/UCI HAR Dataset/features.txt", what="character", sep="\n") %>%
  strsplit(" ") %>%
  sapply("[",2) %>%
  tolower()

#select onesetEx where columns names contains "mean" or "std"
onesetEx <- select(oneset, c(1,2,grep("mean|std",features)+2))

##Step 3

#read the activity labels file
actDF <- read.table("data/UCI HAR Dataset/activity_labels.txt")

#replace label numbers with descriptive activity names
onesetEx$X1 <- actDF$V2[match(onesetEx$X1,actDF$V1)]

##Step 4

#edit text variables by removing "-", "(", ")", & ","
features <-gsub("[-(),]", "", features)

#create a vector of descriptive variable names & replace the column names
descriptiveNames <- c("subject", "activity", features[grep("mean|std",features)])
names(onesetEx) <- descriptiveNames

##Step 5

#use group_by "subject" & "activity"
bySubAct<-group_by(onesetEx,subject,activity)

#then use summarise_all
onesetExAverage<-summarise_all(bySubAct,funs(mean))

#write the result to a file "Tidy.txt"
write.table(onesetExAverage, file = "Tidy One Set.txt", row.names = FALSE)
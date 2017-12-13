## Code Book of Getting and Cleaning UCI Samsung Smartphone Data

# 1. Data
All information concerning the source of the data and the experiments performed to obtain the data can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The `UCI HAR Dataset` contains the following files:
 
- `README.txt`
- `features.txt`:    List of the 561 variables derived from the accelerometer and gyroscope in the smartphones.
- `features_info.txt`:      Describes how the variables listed in `features.txt` were obtained.
- `activity_labels.txt`:    Links the numerical labels associated to the activity performed.
- `subject_train.txt`:    Contains the train subjects referred to numerically as 1 to 30.
- `train/X_train.txt`:     Training dataset (contains 561 variables and 7352 observations).
- `train/y_train.txt`:     Numerical labels (1 to 6) for the activity performed in the training dataset.
- `subject_test.txt`:    Contains the test subjects referred to numerically as 1 to 30.
- `test/X_test.txt`:     Test dataset (contains 561 variables and 2947 observations).
- `test/y_test.txt`:     Numerical labels (1 to 6) for the activity performed in the test dataset.
- `test/Inertial Signals/`:     Files not used in this analysis.
- `train/Inertials Signals/`:     Files not used in this analysis.

The data were downloaded using the R programming language [11]. The downloaded data consist of a sample of 10299 observations of one of 30 participants performing one of the six actions [10]. The 30 participants included in the data set were randomly divided into a training set and a test set [4].

The training set included twenty-one subjects. [1] 1 3 5 6 7 8 11 14 15 16 17 19 21 22 23 25 26 27 28 29 30

The test set included nine subjects. [1] 2 4 9 10 12 13 18 20 24


# 2. Variables

Variables are transformed from the the features listed in the file "features.txt". Transformation process is described in the next section. Here is the list of 88 variables.

	"subject"
	"activity"
	"tbodyaccmeanx"
	"tbodyaccmeany"
	"tbodyaccmeanz"
	"tbodyaccstdx"
	"tbodyaccstdy"
	"tbodyaccstdz"
	"tgravityaccmeanx"
	"tgravityaccmeany"
	"tgravityaccmeanz"
	"tgravityaccstdx"
	"tgravityaccstdy"
	"tgravityaccstdz"
	"tbodyaccjerkmeanx"
	"tbodyaccjerkmeany"
	"tbodyaccjerkmeanz"
	"tbodyaccjerkstdx"
	"tbodyaccjerkstdy"
	"tbodyaccjerkstdz"
	"tbodygyromeanx"
	"tbodygyromeany"
	"tbodygyromeanz"
	"tbodygyrostdx"
	"tbodygyrostdy"
	"tbodygyrostdz"
	"tbodygyrojerkmeanx"
	"tbodygyrojerkmeany"
	"tbodygyrojerkmeanz"
	"tbodygyrojerkstdx"
	"tbodygyrojerkstdy"
	"tbodygyrojerkstdz"
	"tbodyaccmagmean"
	"tbodyaccmagstd"
	"tgravityaccmagmean"
	"tgravityaccmagstd"
	"tbodyaccjerkmagmean"
	"tbodyaccjerkmagstd"
	"tbodygyromagmean"
	"tbodygyromagstd"
	"tbodygyrojerkmagmean"
	"tbodygyrojerkmagstd"
	"fbodyaccmeanx"
	"fbodyaccmeany"
	"fbodyaccmeanz"
	"fbodyaccstdx"
	"fbodyaccstdy"
	"fbodyaccstdz"
	"fbodyaccmeanfreqx"
	"fbodyaccmeanfreqy"
	"fbodyaccmeanfreqz"
	"fbodyaccjerkmeanx"
	"fbodyaccjerkmeany"
	"fbodyaccjerkmeanz"
	"fbodyaccjerkstdx"
	"fbodyaccjerkstdy"
	"fbodyaccjerkstdz"
	"fbodyaccjerkmeanfreqx"
	"fbodyaccjerkmeanfreqy"
	"fbodyaccjerkmeanfreqz"
	"fbodygyromeanx"
	"fbodygyromeany"
	"fbodygyromeanz"
	"fbodygyrostdx"
	"fbodygyrostdy"
	"fbodygyrostdz"
	"fbodygyromeanfreqx"
	"fbodygyromeanfreqy"
	"fbodygyromeanfreqz"
	"fbodyaccmagmean"
	"fbodyaccmagstd"
	"fbodyaccmagmeanfreq"
	"fbodybodyaccjerkmagmean"
	"fbodybodyaccjerkmagstd"
	"fbodybodyaccjerkmagmeanfreq"
	"fbodybodygyromagmean"
	"fbodybodygyromagstd"
	"fbodybodygyromagmeanfreq"
	"fbodybodygyrojerkmagmean"
	"fbodybodygyrojerkmagstd"
	"fbodybodygyrojerkmagmeanfreq"
	"angletbodyaccmeangravity"
	"angletbodyaccjerkmeangravitymean"
	"angletbodygyromeangravitymean"
	"angletbodygyrojerkmeangravitymean"
	"anglexgravitymean"
	"angleygravitymean"
	"anglezgravitymean"

# 3. Transformation

	- The test(9 subjects) & train(21 subjects) subject sets are merged. 
	- The test(9 subjects) & train(21 subjects) activity sets are merged. 
	- The test(9 subjects) & train(21 subjects) sets with 561 features data are merged.
	- All the above 3 sets are then merged into one dataset.
	- The dataset is sorted by subject number then activity number.
	- All "-", "(", ")", & "." are removed from the features listed in "feature.txt".
	- All upper letters are transformed into lower letters.
	- All variables which contains "mean" & "std" are selected. Others discarded.
	- Column 2, "activity" has label numbers replaced by descriptive activity names according to  "activity_labels.txt".
	- Finally, all column data are summarized as the mean of the respective data grouped by subject then activity. As a result, 180 rows (30 subjects x 6 activities) are generated.

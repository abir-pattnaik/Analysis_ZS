train_data<-read.csv('C:/Users/abirp/OneDrive/Desktop/Animal State Prediction/train.csv')
backup_data<-train_data
str(train_data)

#Checking correlation between variables
#Columns

# dob_year                  
# dob_month                 
# train_data$age_upon_intake
# count                     
# age_upon_intake_.days.    
# age_upon_intake_.years.   
# intake_month
# intake_year
# intake_monthyear_month
# intake_monthyear_year
# intake_hour
# intake_number
# time_in_shelter_days
# age_upon_outcome
# age_upon_outcome_.days.
# age_upon_outcome_.years.
# outcome_month
# outcome_year
# outcome_monthyear_month
# outcome_monthyear_year
# outcome_hour
# outcome_number


train_data$age_upon_intake<-sapply(strsplit(as.character(train_data$age_upon_intake)," "), `[`, 1)
train_data$age_upon_intake<-as.numeric(train_data$age_upon_intake)

intake_datetime<-as.POSIXct(train_data$intake_datetime)           

train_data['intake_monthyear_month']<-sapply(strsplit(as.character(train_data$intake_monthyear),"-"), `[`, 1)
train_data$intake_monthyear_month<-as.numeric(train_data$intake_monthyear_month)

train_data['intake_monthyear_year']<-sapply(strsplit(as.character(train_data$intake_monthyear),"-"), `[`, 2)
train_data$intake_monthyear_year<-as.numeric(train_data$intake_monthyear_year)

train_data$age_upon_outcome<-sapply(strsplit(as.character(train_data$age_upon_outcome)," "), `[`, 1)
train_data$age_upon_outcome<-as.numeric(train_data$age_upon_outcome)

train_data$date_of_birth<-as.Date(as.POSIXct(train_data$date_of_birth))

train_data['outcome_monthyear_month']<-sapply(strsplit(as.character(train_data$outcome_monthyear),"-"), `[`, 1)
train_data$outcome_monthyear_month<-as.numeric(train_data$outcome_monthyear_month)

train_data['outcome_monthyear_year']<-sapply(strsplit(as.character(train_data$outcome_monthyear),"-"), `[`, 2)
train_data$outcome_monthyear_year<-as.numeric(train_data$outcome_monthyear_year)

corrplot_list<-
c('dob_year'
,'dob_month'
,'train_data$age_upon_intake'
,'count'
,'age_upon_intake_.days.'
,'age_upon_intake_.years.'
,'intake_month'
,'intake_year'
,'intake_monthyear_month'
,'intake_monthyear_year'
,'intake_hour'
,'intake_number'
,'time_in_shelter_days'
,'age_upon_outcome'
,'age_upon_outcome_.days.'
,'age_upon_outcome_.years.'
,'outcome_month'
,'outcome_year'
,'outcome_monthyear_month'
,'outcome_monthyear_year'
,'outcome_hour'
,'outcome_number')


library(corrplot)

subset_data<-subset(x = train_data,select=c('dob_year'
                                            ,'dob_month'
                                            ,'age_upon_intake'
                                            ,'age_upon_intake_.days.'
                                            ,'age_upon_intake_.years.'
                                            ,'intake_month'
                                            ,'intake_year'
                                            ,'intake_monthyear_month'
                                            ,'intake_monthyear_year'
                                            ,'intake_hour'
                                            ,'intake_number'
                                            ,'time_in_shelter_days'
                                            ,'age_upon_outcome'
                                            ,'age_upon_outcome_.days.'
                                            ,'age_upon_outcome_.years.'
                                            ,'outcome_month'
                                            ,'outcome_year'
                                            ,'outcome_monthyear_month'
                                            ,'outcome_monthyear_year'
                                            ,'outcome_hour'
                                            ,'outcome_number'
                                            ))







View(cor(subset_data))




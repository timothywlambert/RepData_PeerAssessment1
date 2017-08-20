#################
#Course Five Project 1
#################

library(dplyr)

activity_data <-read.csv(paste0(getwd(),"/activity.csv"))

#What is mean total number of steps taken per day?
stepsperday <- activity_data %>%
  group_by(date) %>%
  summarise(sum(steps))
hist(stepsperday$`sum(steps)`)
meanstepsperday <- mean(na.omit(stepsperday$`sum(steps)`))
medianstepsperday <- median(na.omit(stepsperday$`sum(steps)`))
meanstepsperday
medianstepsperday

#What is the average daily activity pattern?
stepsperinterval <- activity_data %>%
  group_by(interval) %>%
  summarise(mean(na.omit(steps)))
 
plot(stepsperinterval$interval, stepsperinterval$`mean(na.omit(steps))`, type = "l")

#Input missing values
activity_data_na <- subset(activity_data, is.na(activity_data))
activity_data_na <- left_join(activity_data_na, stepsperinterval)
activity_data_na$steps <- activity_data_na$`mean(na.omit(steps))`
activity_data_na <- activity_data_na[,-c(4)]
activity_data_new <- subset(activity_data, steps >= 0)
activity_data_new <- rbind(activity_data_na, activity_data_new)

stepsperday_new <- activity_data_new %>%
  group_by(date) %>%
  summarise(sum(steps))

meanstepsperday_new <- mean(stepsperday_new$`sum(steps)`)
medianstepsperday_news <- mean(stepsperday_new$`sum(steps)`)

meanstepsperday_new
medianstepsperday_news

hist(stepsperday_new$`sum(steps)`)

#Create weekdays and weekends and plot
activity_data_new$date <- as.Date(activity_data_new$date)
activity_data_new$day <- weekdays(activity_data_new$date)
activity_data_new$day <- ifelse(activity_data_new$day == "Saturday" |
                                  activity_data_new$day == "Sunday",
                                "Weekend", "Weekday")

weekendinterval <- activity_data_new %>%
  filter(day == "Weekend") %>%
  group_by(interval) %>%
  summarise(mean(steps))

weekdayinterval <- activity_data_new %>%
  filter(day == "Weekday") %>%
  group_by(interval) %>%
  summarise(mean(steps))

par(mfrow=c(1,2))
plot(weekendinterval$interval, weekendinterval$`mean(steps)`, type="l")
plot(weekdayinterval$interval, weekdayinterval$`mean(steps)`, type="l")


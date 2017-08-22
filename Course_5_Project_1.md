R Markdown
----------

It is now possible to collect a large amount of data about personal
movement using activity monitoring devices such as a Fitbit, Nike
Fuelband, or Jawbone Up. The mean and median steps are below along with
a histogram of the number of steps.

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

![](Course_5_Project_1_files/figure-markdown_strict/unnamed-chunk-1-1.png)

    ## [1] 10766.19

    ## [1] 10765

Plot of Steps Per Interval during the day.
------------------------------------------

When we replace all NA values with the average for the particular day,
the mean, median, and histogram do not change.

![](Course_5_Project_1_files/figure-markdown_strict/unnamed-chunk-2-1.png)

    ## Joining, by = "interval"

    ## [1] 10766.19

    ## [1] 10766.19

![](Course_5_Project_1_files/figure-markdown_strict/unnamed-chunk-3-1.png)

Compare Weekend vs. Weekday
---------------------------

![](Course_5_Project_1_files/figure-markdown_strict/unnamed-chunk-4-1.png)

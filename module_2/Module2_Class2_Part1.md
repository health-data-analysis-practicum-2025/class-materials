---
title: "Class 2-2, Part 1"
author: "Health Data Analysis Practicum (AS.280.347)"
date: "February 19, 2025"
output: 
  html_document:
    toc: true
    toc_float: 
      toc_collapsed: true
    toc_depth: 3
    number_sections: false
    keep_md: yes
---






# Initial data inspection (continued)


``` r
dat <- read_sas('module_2/data/d.sas7bdat')
rename <- dat %>% 
  select(id = KEY,
         age = SPAGE,
         race = DMQ_14_1,
         gender = GENDER,
         born = US_BORN,
         diet = DBQ_1,
         income = INC20K,
         diabetes = DIQ_1,
         bmi = BMI,
         cholesterol = BPQ_16,
         drinkfreq = ALQ_1,
         drinkunit = ALQ_1_UNIT,
         smoking = SMOKER3CAT,
         hypertension = BPQ_2,
         surveyweight = EXAM_WT)
summary(rename)
```

```
##       id                 age             race           gender    
##  Length:1527        Min.   :20.00   Min.   :100.0   Min.   :1.00  
##  Class :character   1st Qu.:30.00   1st Qu.:100.0   1st Qu.:1.00  
##  Mode  :character   Median :42.00   Median :110.0   Median :2.00  
##                     Mean   :44.55   Mean   :136.8   Mean   :1.58  
##                     3rd Qu.:57.00   3rd Qu.:180.0   3rd Qu.:2.00  
##                     Max.   :97.00   Max.   :250.0   Max.   :2.00  
##                                     NA's   :59                    
##       born           diet          income         diabetes          bmi       
##  Min.   :1.00   Min.   :1.00   Min.   :1.000   Min.   :1.000   Min.   :12.31  
##  1st Qu.:1.00   1st Qu.:2.00   1st Qu.:1.000   1st Qu.:2.000   1st Qu.:23.33  
##  Median :1.00   Median :3.00   Median :2.000   Median :2.000   Median :26.52  
##  Mean   :1.44   Mean   :2.92   Mean   :2.985   Mean   :1.923   Mean   :27.73  
##  3rd Qu.:2.00   3rd Qu.:4.00   3rd Qu.:5.000   3rd Qu.:2.000   3rd Qu.:30.71  
##  Max.   :2.00   Max.   :5.00   Max.   :6.000   Max.   :3.000   Max.   :69.17  
##  NA's   :8      NA's   :3      NA's   :161     NA's   :1       NA's   :38     
##   cholesterol      drinkfreq         drinkunit        smoking     
##  Min.   :1.000   Min.   :  0.000   Min.   :1.000   Min.   :1.000  
##  1st Qu.:1.000   1st Qu.:  0.000   1st Qu.:1.000   1st Qu.:1.000  
##  Median :2.000   Median :  2.000   Median :1.000   Median :1.000  
##  Mean   :1.719   Mean   :  5.105   Mean   :1.726   Mean   :1.598  
##  3rd Qu.:2.000   3rd Qu.:  4.000   3rd Qu.:2.000   3rd Qu.:2.000  
##  Max.   :2.000   Max.   :365.000   Max.   :3.000   Max.   :3.000  
##  NA's   :15      NA's   :6         NA's   :412     NA's   :3      
##   hypertension    surveyweight  
##  Min.   :1.000   Min.   :    0  
##  1st Qu.:1.000   1st Qu.: 2882  
##  Median :2.000   Median : 3678  
##  Mean   :1.726   Mean   : 4116  
##  3rd Qu.:2.000   3rd Qu.: 5010  
##  Max.   :2.000   Max.   :16036  
##  NA's   :3
```

## Non-categorical variables 

There are four non-categorical variables that we will use in our analysis:

  * `id`: Sample case ID, unique to each individual in the sample
  * `age`: Sample age (range of 20-97 years)
  * `bmi`: BMI = kg/m^2^ where _kg_ is a person's weight in kilograms and _m_ is their height in meters
  * `drinkfreq`: In the past 12 months, how often did sample drink any type of alcoholic beverage (value)
  * `surveyweight`: Numeric values associated with each observation to let us know how much weight the observation should receive in our analysis (more details later)
  
## Categorical variables 

We will consider ten categorical variables. Note that the levels of these variables are detailed in the [Variable Codebook](https://med.nyu.edu/departments-institutes/population-health/divisions-sections-centers/epidemiology/sites/default/files/nyc-hanes-datasets-and-resources-public-dataset-codebook.pdf). 

  * `race`: 
    + 100 = White
    + 110 = Black/African American
    + 120 = Indian
    + 140 = Native Hawaiian/Other Pacific Islander
    + 180 = Asian
    + 250 = Other race
  * `gender`:
    + 1 = Male
    + 2 = Female
  * `born`:
    + 1 = US born
    + 2 = Other country
  * `diet`: 
    + 1 = Excellent
    + 2 = Very good 
    + 3 = Good
    + 4 = Fair
    + 5 = Poor
  * `diabetes`: Has person ever been told by a doctor or health professional that they have diabetes or sugar diabetes?
    + 1 = Yes
    + 2 = No 
    + 3 = Prediabetes
  * `cholesterol`: Has person ever been told by a doctor or health professional that their blood cholesterol was high?
    + 1 = Yes
    + 2 = No
  * `drinkunit`: In the past 12 months, how often did sample drink any type of alcoholic beverage (frequency unit for `drink`)
    + 1 = per week
    + 2 = per month
    + 3 = per year
  * `smoke`: 
    + 1 = Never smoker
    + 2 = Current smoker
    + 3 = Former smoker
  * `income`:
    + 1 = Less than $20,000
    + 2 = $20,000 - $39,999
    + 3 = $40,000 - $59,999
    + 4 = $60,000 - $79,999
    + 5 = $80,000 - $99,999
    + 6 = $100,000 or more
  * `hypertension`: Has person ever been told by a doctor or health professional that they have hypertension or high blood pressure?
    + 1 = Yes
    + 2 = No


# Adjust data types

From the data summaries above, we can see that there are several _categorical_ variables like `race`, `gender`, `born`, `diet`, `income`, `diabetes`, `bmi`, `drinkunit`, and `smoke` that are currently being treated as _numerical_ variables (resulting in means/medians in the summary). **Why is this happening?**

We want to convert these categorical variables to factors using the numerical values and category labels given in the 
[Variable Codebook](https://med.nyu.edu/departments-institutes/population-health/divisions-sections-centers/epidemiology/sites/default/files/nyc-hanes-datasets-and-resources-public-dataset-codebook.pdf) and shown earlier in this document.

We can use the `factor()` function in base R to convert each variable and assign the correct levels. 

* Any values that are not included in the `levels` argument will get set to `NA` values. 
* We also want to think about creating a natural ordering to the factor levels here: the first level will generally be our reference level in a regression model, so it makes sense to try to give them an order that reflects our choice of reference group.  For example, we will probably want to examine diet in increasing order of how good it is, so we order the levels from 5 ("poor") to 1 ("excellent"), rather than 1 to 5, and assign the labels appropriately.


``` r
hy_df <- rename %>% 
  mutate(race = factor(race, 
                       levels = c(100, 110, 120, 140, 180, 250), 
                       labels = c('White', 'Black/African American', 
                                  'Indian /Alaska Native', 
                                  'Pacific Islander', 
                                  'Asian', 'Other Race')),
         gender = factor(gender, 
                         levels = c(1, 2), 
                         labels = c('Male', 'Female')),
         born = factor(born, 
                       levels = c(1, 2),
                       labels = c("US Born", "Non-US Born")),
         diet = factor(diet, 
                       levels = c(5:1), 
                       labels = c('Poor', 'Fair', 'Good', 
                                  'Very good','Excellent')),
         income = factor(income, 
                         levels = c(1:6), 
                         labels = c('Less than $20,000','$20,000 - $39,999',
                                    '$40,000 - $59,999','$60,000 - $79,999',
                                    '$80,000 - $99,999','$100,000 or more')),
         diabetes = factor(diabetes, 
                           levels = c(2, 1, 3), 
                           labels = c('No','Yes','Prediabetes')),
         cholesterol = factor(cholesterol, 
                              levels = c(2, 1), 
                              labels = c('Low value','High value')),
         smoking = factor(smoking, 
                          levels=c(3:1), 
                          labels = c('Never smoker','Former smoker','Current smoker')),
         hypertension = factor(hypertension, 
                               levels = c(2, 1), 
                               labels = c('No','Yes'))
  )
```

If we look at a summary of our data set again, we now have counts for each category of the categorical variables rather than the meaningless numerical summaries, like means, it was giving before.

``` r
summary(hy_df)
```

```
##       id                 age                            race        gender   
##  Length:1527        Min.   :20.00   White                 :629   Male  :642  
##  Class :character   1st Qu.:30.00   Black/African American:390   Female:885  
##  Mode  :character   Median :42.00   Indian /Alaska Native : 13               
##                     Mean   :44.55   Pacific Islander      : 10               
##                     3rd Qu.:57.00   Asian                 :207               
##                     Max.   :97.00   Other Race            :219               
##                                     NA's                  : 59               
##           born            diet                   income           diabetes   
##  US Born    :851   Poor     :101   Less than $20,000:406   No         :1328  
##  Non-US Born:668   Fair     :341   $20,000 - $39,999:309   Yes        : 158  
##  NA's       :  8   Good     :567   $40,000 - $59,999:157   Prediabetes:  40  
##                    Very good:365   $60,000 - $79,999:139   NA's       :   1  
##                    Excellent:150   $80,000 - $99,999:103                     
##                    NA's     :  3   $100,000 or more :252                     
##                                    NA's             :161                     
##       bmi            cholesterol     drinkfreq         drinkunit    
##  Min.   :12.31   Low value :1087   Min.   :  0.000   Min.   :1.000  
##  1st Qu.:23.33   High value: 425   1st Qu.:  0.000   1st Qu.:1.000  
##  Median :26.52   NA's      :  15   Median :  2.000   Median :1.000  
##  Mean   :27.73                     Mean   :  5.105   Mean   :1.726  
##  3rd Qu.:30.71                     3rd Qu.:  4.000   3rd Qu.:2.000  
##  Max.   :69.17                     Max.   :365.000   Max.   :3.000  
##  NA's   :38                        NA's   :6         NA's   :412    
##            smoking    hypertension  surveyweight  
##  Never smoker  :316   No  :1106    Min.   :    0  
##  Former smoker :280   Yes : 418    1st Qu.: 2882  
##  Current smoker:928   NA's:   3    Median : 3678  
##  NA's          :  3                Mean   : 4116  
##                                    3rd Qu.: 5010  
##                                    Max.   :16036  
## 
```


# Follow up on questions from last class

## Coding of hypertension variable

Notice the ordering of the hypertension variable above. This will make "No Hypertension" the reference group, making it easier to interpret any modeling output with hypertension as the outcome.

## Drink coding/missing values

Using the [Variable Codebook](https://med.nyu.edu/departments-institutes/population-health/divisions-sections-centers/epidemiology/sites/default/files/nyc-hanes-datasets-and-resources-public-dataset-codebook.pdf), we see that `drinkfreq` (`ALQ_1` in the original survey data) and `drinkunit` (`ALQ_1_UNIT` in the original survey data) together reflect the respondent's answer to the question of how often they drink any type of alcoholic beverage. Specifically, each respondent's drinking frequency may be defined as **`drinkfreq`** drinks per **`drinkunit`**. For example:

  * If `drinkfreq` = 2 and `drinkunit` = 1, the respondent reported drinking **2** times per **week**
  * If `drinkfreq` = 3 and `drinkunit` = 2, the respondent reported drinking **3** times per **month**
  * If `drinkfreq` = 30 and `drinkunit` = 3, the respondent reported drinking **30** times per **year**

Note that a value of `drinkfreq` = 0 means the respondent never drinks.

Let's look at the frequency of counts for the `drinkfreq` variable with the function `count()`.


``` r
hy_df %>% 
  count(drinkfreq) %>% 
  print(n = Inf)
```

```
## # A tibble: 30 × 2
##    drinkfreq     n
##        <dbl> <int>
##  1         0   406
##  2         1   267
##  3         2   276
##  4         3   183
##  5         4   100
##  6         5    80
##  7         6    40
##  8         7    68
##  9         8     7
## 10        10    25
## 11        12     9
## 12        14     6
## 13        15     6
## 14        16     1
## 15        17     1
## 16        20    14
## 17        24     6
## 18        25     2
## 19        28     1
## 20        30     8
## 21        40     1
## 22        50     1
## 23        60     1
## 24       100     1
## 25       144     1
## 26       180     1
## 27       189     1
## 28       200     1
## 29       365     7
## 30        NA     6
```

Now look at the frequency of counts for the `drinkunit` variable.


``` r
hy_df %>% 
  count(drinkunit) %>% 
  print(n = Inf)
```

```
## # A tibble: 4 × 2
##   drinkunit     n
##       <dbl> <int>
## 1         1   566
## 2         2   288
## 3         3   261
## 4        NA   412
```

There are 406 people who indicated that they never drink.  These individuals would not have been asked (and therefore would not have provide a response to) the subsequent question regarding their frequency of drinking in the past 12 months. Now we see why there are so many missing values for `drinkunit`! 

Out of the 412 subjects missing a value for `drinkunit`, 406 _never drink_; therefore, there are actually just 6 truly missing values. **Merging these two variables into one is a better way to capture drinking frequency completely.** But how to combine them? 

# Initial questions for group discussion

(1) How might we combine the `drinkfreq` and `drinkunit` variables into one variable, `drink`? Write some code to create this `drink` variable and justify your choice to make it continuous or categorical (i.e., 2 or more categories)?

(2) Find one or two other variables in the code chunk above where you could argue that the levels of the factors should be reordered.




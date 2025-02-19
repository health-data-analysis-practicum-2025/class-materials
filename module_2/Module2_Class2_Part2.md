---
title: "Class 2-2, Part 2"
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






The code below includes recoding of the variables, including creating the new `drink` variable.


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
```

We'll define the new `drink` variable by normalizing the reported frequencies using a common denominator. I've chosen **per week** here, but you could use **per month** or **per year** or even **per day**. We need to define `drinkfreq` by the reported `drinkunit` converted to weeks, so:

  * if `drinkfreq` = 1 ("per week"), the denominator is already 1 week (NOTE: We'll also use this when `drinkfreq` = 0)
  * if `drinkfreq` = 2 ("per month"), the denominator will be 4.33 (average number of weeks per month)
  * if `drinkfreq` = 3 ("per year"), the denominator will be 52 (number of weeks in a year)


``` r
rename <- rename %>% 
  mutate(drink_denom = case_when(drinkfreq == 0 | drinkunit == 1 ~ 1,
                                   drinkunit == 2 ~ 52 / 12,
                                   drinkunit == 3 ~ 52),
         drink = drinkfreq / drink_denom)

summary(rename$drink)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
##  0.0000  0.0000  0.4615  1.4112  2.0000 24.0000       6
```

Notice that now only 6 respondents are missing a value for the new `drink` variable -- we have appropriately included those who don't drink (and therefore have a drinking frequency of 0 drinks per week) with those who do drink.

What kind of distribution does the `drink` variable have?


``` r
hist(rename$drink)
```

![](Module2_Class2_Part2_files/figure-html/histdrink-1.png)<!-- -->

Perhaps we can consider a categorical version of this variable. We'll use a cutoff of one drink per week; that is to say...

  * Respondents who drink less than once per week are coded **0**
  * Respondents who drink at least once per week are coded **1**
  
This cutoff would mean that 58.5% of respondents would be coded 0 and the rest would be coded 1. 


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
         drinkcat = factor(drink >= 1, 
                        labels = c('<1 / wk', '1+ / week')),
         smoking = factor(smoking, 
                          levels=c(3:1), 
                          labels = c('Never smoker','Former smoker','Current smoker')),
         hypertension = factor(hypertension, 
                               levels = c(2, 1), 
                               labels = c('No','Yes'))
  ) %>% 
  drop_na(hypertension) # drop observations where the outcome of interest is missing
```

# Exploratory data analysis

Before doing any modeling, we start with simple data visualizations to look at the data and investigate how the different variables are related to one another. Plots can identify the trends or patterns in the variables of interest and inform the next steps in the data analysis. For our data visualizations, we will mainly use the package `ggplot2` available as one of the core `tidyverse` packages. A link for its cheat sheet is [here]( https://raw.githubusercontent.com/rstudio/cheatsheets/main/data-visualization.pdf).

The type of plot we will make will depend on the type of variable(s) we are plotting.  First, let's look at the relationship between `hypertension` (categorical) and `age` (numeric). Since `hypertension` is the categorical variable, we can compare the age distributions between those who are hypertense and those who are not using side-by-side boxplots.  Here the variable on the x-axis is `hypertension` and the variable on the y-axis is `age`, which corresponds to the `aes(x=hypertension, y=age)` definition in the `ggplot` aesthetic definition.


``` r
p1 <- hy_df %>% 
  ggplot(aes(x = hypertension, y = age)) +
  geom_boxplot() + 
  ggtitle('Distribution of age by hypertension status')

p1
```

![](Module2_Class2_Part2_files/figure-html/boxhyage-1.png)<!-- -->

Comparing the medians of these two boxplots, we see that people who are hypertense tend to be older than people who are not (median age for non-hypertense individuals 36, median age for hypertense individuals 56), which indicates that age is related to hypertension.

What about a plot for investigating the relationship between `hypertension` and `gender`? Let's try three different ways to plot the categorical variable `gender` with `hypertension`.  We'll use the function `ggarrange()` in [package `ggpubr`](https://www.rdocumentation.org/packages/ggpubr/versions/0.2) to arrange multiple ggplot objects on the same page. 


``` r
p2 <- hy_df %>% 
  ggplot(aes(x = hypertension, y=gender)) + 
  geom_boxplot() + ggtitle('distribution of gender')

p3 <- hy_df %>% 
  ggplot(aes(x = hypertension, fill = gender)) + 
  geom_bar() + 
  ggtitle('distribution of gender')

p4 <- hy_df %>% 
  ggplot(aes(x = hypertension, fill = gender)) + 
  geom_bar(position = "fill") + 
  ggtitle('distribution of gender') + 
  ylab('proportion')

ggarrange(p2, p3, p4, ncol=3, nrow=1)
```

![](Module2_Class2_Part2_files/figure-html/multipanel-1.png)<!-- -->

The left plot uses `geom_boxplot()` as we did with `age`, but it fails to show the relationship of interest! Boxplots are not what we want for a categorical variable like `gender`, so we need another plotting method. 

The middle and right plots use barplots to look at the relationship between `hypertension` and `gender`. This time it works! The middle plot shows the count of males and females for those with and without hypertension.  The right plot more clearly shows the proportion of males and females within each hypertension group by using the `position='fill'` option in the `geom_bar()` function. The y-axis in the right plot is proportion rather than count. From this visualization, we see that a slightly lower proportion of the hypertense individuals are female compared to the non-hypertense individuals.

## Discussion of data visualization choices

In your groups, take 10-15 minutes to discuss the following questions that have come up in our initial examination of the NHANES data set, as it relates to hypertension:

(1) What do you think about the data displays above to show the relationship between gender and hypertension? Do they clearly illustrate how hypertension rate varies with gender? What improvements could you propose? What limitations are inherent in the data that are collected as part of this survey?

(2) For each of the other variables included in the current data set, consider what kind of data visualization you would make to illustrate the relationship between that variable and hypertension status.



### Data visualization of relationship between gender and hypertension
<details><summary> _Click here for details on how to improve the data display of the relationship between gender and hypertension_ </summary>
<br>
As you probably discussed, the plots above show the distribution of gender between the hypertension groups, but we really want to see whether there is a difference in hypertension rates between gender groups. To do this, we switch the x-axis and y-axis, to show `hypertension` as a function of `gender`, rather than the other way around. 


``` r
p3b <- hy_df %>% 
  ggplot(aes(x = gender, fill = hypertension)) + 
  geom_bar() + ggtitle('distribution of hypertension')

p4b <- hy_df %>% 
  ggplot(aes(x = gender, fill = hypertension)) + 
  geom_bar(position = "fill") + 
  ggtitle('distribution of hypertension') + 
  ylab('proportion')

ggarrange(p3b, p4b, ncol=2, nrow=1)
```

![](Module2_Class2_Part2_files/figure-html/multipanel2-1.png)<!-- -->

Now we can compare the distribution of hypertension between males and females.  From this visualization we see that a slightly higher proportion of males than females in our dataset have hypertension. This is a good lesson to keep in mind as you create your own data visualizations this week for your assignment.

Let's finish by looking at the relationship between hypertension and drinking using both of our derived drinking variables: `drink` and `drinkcat`.


``` r
p5 <- hy_df %>% 
  drop_na(drink) %>% 
  ggplot(aes(x = hypertension, y = drink)) +
  geom_boxplot() 

p6 <- hy_df %>% 
  drop_na(drinkcat) %>% 
  ggplot(aes(x = drinkcat, fill = hypertension)) + 
  geom_bar(position = "fill") + 
  ggtitle('distribution of hypertension') + 
  ylab('proportion')

ggarrange(p5, p6, ncol = 2, nrow = 1)
```

![](Module2_Class2_Part2_files/figure-html/multipanel3-1.png)<!-- -->

</details>

## Assignment 2.1

Create one or more data displays with the NYC HANES data to answer Question 2.1: What factors measured in the NYC HANES survey are associated with having hypertension?

You should review the [Variable Codebook](https://med.nyu.edu/departments-institutes/population-health/divisions-sections-centers/epidemiology/sites/default/files/nyc-hanes-datasets-and-resources-public-dataset-codebook.pdf) to decide if there are additional variables that you want to explore, beyond the ones selected here. You should include relevant recoding and data cleaning in order to get a data set that is best suited to answer the question of interest. Think carefully about how you want to account for data observations with missing values.

* Submit your data display in R Markdown through Github by Sunday (Feb 23, 2025) at midnight.
* Post a screenshot of your data display (just the graph or table) on Piazza in the "Assignment 2-1 Results" thread.  Add a sentence or two that describes what your visualization shows.  You are welcome to post this anonymously to your classmates. You can also include comments about what you chose to do or questions you had as you were making the display and fitting your model.
* You may work together on this assignment, but you must submit your own data display; please credit in your assignment anyone with whom you collaborated.
* Next week in class we will start with discussion of your work

## Bonus content for Module 2

Throughout our courses, we use case-study style analyses to present data science and statistics concepts in the context of public health questions and data collected from real life. A couple of years ago, we were involved in developing teaching materials in this style as part of the [Open Case Studies](https://www.opencasestudies.org) project. These case studies are full of useful examples of obtaining data from varied sources, from websites, to pdfs to twitter feeds. They also present steps to create useful and intricate data visualizations as well as in-depth presentations of statistical methods. As you seek inspiration for your own projects later in the course, or aim to expand your own data science skills, you might find them to be a useful resource. We especially recommend the interface [here](https://americanhealth.jhu.edu/open-case-studies) which provides additional tools for navigating among ten of the case studies. We may post prompts on Piazza to encourage your engagement with these materials in the coming weeks.

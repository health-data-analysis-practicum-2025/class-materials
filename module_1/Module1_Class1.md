---
title: "Class 1-1: Course Introduction"
author: "Health Data Analysis Practicum (AS.280.347)"
date: "January 23, 2025"
output: 
  html_document:
    toc: true
    toc_float: 
      toc_collapsed: false
    toc_depth: 4
    number_sections: false
    keep_md: yes
---



## Course information

**Objective:** To enable each student to enhance his/her quantitative, scientific reasoning and to achieve a functional standard in statistical data analysis using the `R` statistical language.

**Modular Organization:** 

* Module 1: Smoking and the risk of disease
* Module 2: Factors associated with hypertension
* Module 3: Individual public health data analysis projects!

**Computation:** Statistical software R

* Have your laptop available for each course meeting
* We will work with R through the Posit Cloud interface ([https://posit.cloud/](https://posit.cloud/))
* You will create all of your assignments using R Markdown
* You are encouraged to complete online tutorials on using R through Posit Cloud ("Learn" --> "Primers" in the left-hand menu) - no longer exists -- use Swirl instead!
* Another great resource for learning R is the online book "R for Data Science", which you can access for free at [https://r4ds.had.co.nz/](https://r4ds.had.co.nz/) and  [https://r4ds.hadley.nz/](https://r4ds.hadley.nz/) (second edition).

**Version control/collaboration**: GitHub

* GitHub is an online compendium of file repositories where people can share their work, work collaboratively with others, and easily use a version control system to track development of software and projects
* We will share course materials and assignments through Github
* You will turn in your work through GitHub
* We will give comments on your work through Github

**Class structure:**

* **On Mondays:**
    * We will usually start class by sharing and discussing YOUR work that has been done in the previous week
    * We will ask that you turn in your work to us (post on Piazza and push to GitHub) by Sunday night at midnight so we can prepare for Monday's class
    * Everyone should be prepared to talk about their work and provide constructive feedback to their classmates each week
* **On Wednesdays:** 
    * After completing new content for the week, we will give you time in class to work on the next week's assignment
    * Use the class time to work with your peers and/or ask us questions while you work

**Communicating with instructor:**

* If you need to email us about a course-related matter: phbiostats@jhu.edu
* This account is accessed by Dr. Taub and helps her keep track of course-related messages outside her messy inbox
* Emails to my individual account about a course-related matter will NOT receive a reply
* If asking a question about code or other work for an assignment, please post on Piazza instead of emailing.  You can post anonymously to your classmates or make a private post to instructors.

**Syllabus:** You should read the entire syllabus and let us know if you have any questions or concerns.

## Module 1: Smoking and the risk of disease


What is the risk of smoking-caused disease, like lung cancer (LC) and coronary heart disease (CHD), the contribution of smoking to this risk, and the possible modification of this risk by sex and socio-economic status (SES)?

**Questions of interest:**

* *Question 1.1:* How does the risk of disease compare for smokers and otherwise similar non-smokers?

* *Queston 1.2:* Does the contribution of smoking to the risk of disease vary by sex or socio-economic status (SES)?

**To address each question we want to construct:**

* A data display (graph or table)
* A statistical analysis (with interpretation)

We will answer these questions using data from the National Medical Expenditures Survey (NMES).

## NMES data

Let's take a look at the NMES data.  This data is stored in the file `nmesUNPROC.csv` in the same `module_1` folder that includes this .Rmd file.

We will read the data into R using the `read_csv()` function from the `readr` package.  This `readr` package is part of a core group of packages called the `tidyverse`.  In order to use a package in R, you must first install the package (once) and then load the package (each time you are in a new session of R).  We will often be working with the tidyverse packages in the course, so we have already installed these packages in our shared RStudio cloud workspace.  We still need to load these packages each time we are going to use them in an R session.  We can load all of the core tidyverse packages at once like this:

``` r
library(tidyverse)
```

```
## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
## ✔ dplyr     1.1.4     ✔ readr     2.1.5
## ✔ forcats   1.0.0     ✔ stringr   1.5.1
## ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
## ✔ lubridate 1.9.3     ✔ tidyr     1.3.1
## ✔ purrr     1.0.2     
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```

Now we can read the data into R:

``` r
nmes_data <- read_csv("nmesUNPROC.csv")
```

```
## Rows: 4078 Columns: 16
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## dbl (16): id, totalexp, lc5, chd5, eversmk, current, former, packyears, year...
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

Since the the default working directory (where R looks for files) is the project directory, we need to tell R where to find this data file.  In the path above, you can see that we tell R to look in the `module_1` folder and then give it the file name.

Let's get an idea of the variables in this NMES dataset.  Here is a codebook for these variables:

* `age`: age in years
* `female`: 1=female, 0=male
* `eversmk`: 1=has ever been a smoker, 0=has never been a smoker
* `current`: 1=current smoker, 0=not current smoker (but formerly smoked), NA if eversmk=0
* `former`: 1=former smoker, 0=not former smoker
* `packyears`: reported packs per year of smoking (0 if eversmk = No)
* `yearsince`: years since quitting smoking (0 if eversmk = No)
* `totalexp`: self-reported total medical expenditures for 1987
* `lc5`: 1=lung cancer, laryngeal cancer or COPD, 0=none of these
* `chd5`: 1=coronary heart disease, stroke, and other cancers (oral, esophageal, stomach, kidney and bladder), 0=none of these
* `beltuse`: 1=rare, 2=some, 3=always/almost always
* `educate`: 1=college graduatee, 2=some college, 3=HS grad, 4=other
* `marital`: 1=married, 2=widowed, 3=divorced, 4=separated, 5=never married
* `poor`: 1=poor, 0=not poor

We can peek at the data itself in a couple of ways:

* The `glimpse()` function shows us the first few values of each variable:

``` r
glimpse(nmes_data)
```

```
## Rows: 4,078
## Columns: 16
## $ id        <dbl> 20449, 15534, 9503, 15024, 17817, 31716, 679, 32819, 33173, …
## $ totalexp  <dbl> 25951.58, 378.33, 51.18, 1899.20, 153.50, 270.00, 142.00, 89…
## $ lc5       <dbl> 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
## $ chd5      <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
## $ eversmk   <dbl> 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, …
## $ current   <dbl> NA, 1, 0, NA, 1, NA, NA, 0, NA, NA, 0, NA, NA, NA, NA, NA, N…
## $ former    <dbl> 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, …
## $ packyears <dbl> 0.0, 3.0, 40.0, 0.0, 86.0, 0.0, 0.0, 0.9, 0.0, 0.0, 26.0, 0.…
## $ yearsince <dbl> 0, 0, 9, 0, 0, 0, 0, 32, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 45, 0…
## $ bmi       <dbl> 23.96408, 26.68133, 22.32027, 25.06986, 20.23634, 22.19736, …
## $ beltuse   <dbl> 2, 3, 3, 3, 3, 2, 3, 3, 3, 3, 3, 3, 1, 3, 3, 3, 3, 3, 3, 3, …
## $ educate   <dbl> 4, 1, 4, 4, 1, 1, 1, 1, 1, 4, 3, 4, 4, 4, 4, 1, 3, 3, 4, 4, …
## $ marital   <dbl> 1, 5, 1, 2, 1, 5, 1, 1, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 1, 2, …
## $ poor      <dbl> 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, …
## $ age       <dbl> 78, 30, 72, 64, 59, 25, 58, 56, 26, 81, 79, 79, 76, 73, 64, …
## $ female    <dbl> 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, …
```

* The `head()` functions shows us the first few rows of the dataset:

``` r
head(nmes_data)
```

```
## # A tibble: 6 × 16
##      id totalexp   lc5  chd5 eversmk current former packyears yearsince   bmi
##   <dbl>    <dbl> <dbl> <dbl>   <dbl>   <dbl>  <dbl>     <dbl>     <dbl> <dbl>
## 1 20449  25952.      1     0       0      NA      0         0         0  24.0
## 2 15534    378.      0     0       1       1      0         3         0  26.7
## 3  9503     51.2     0     0       1       0      1        40         9  22.3
## 4 15024   1899.      0     0       0      NA      0         0         0  25.1
## 5 17817    154.      0     0       1       1      0        86         0  20.2
## 6 31716    270       0     0       0      NA      0         0         0  22.2
## # ℹ 6 more variables: beltuse <dbl>, educate <dbl>, marital <dbl>, poor <dbl>,
## #   age <dbl>, female <dbl>
```
Notice that this display is optimized to fit our display screen, and we only see the variables that will nicely fit in the display.  This is because our data is stored as a tibble, which is a particular way to display a data set.  Change the dimensions of your console window and re-run this command to see what happens!  If we want to force R to show us all rows, we can force the width of what is displayed using the `print()` function:

``` r
head(nmes_data) %>%
  print(width = Inf)
```

```
## # A tibble: 6 × 16
##      id totalexp   lc5  chd5 eversmk current former packyears yearsince   bmi
##   <dbl>    <dbl> <dbl> <dbl>   <dbl>   <dbl>  <dbl>     <dbl>     <dbl> <dbl>
## 1 20449  25952.      1     0       0      NA      0         0         0  24.0
## 2 15534    378.      0     0       1       1      0         3         0  26.7
## 3  9503     51.2     0     0       1       0      1        40         9  22.3
## 4 15024   1899.      0     0       0      NA      0         0         0  25.1
## 5 17817    154.      0     0       1       1      0        86         0  20.2
## 6 31716    270       0     0       0      NA      0         0         0  22.2
##   beltuse educate marital  poor   age female
##     <dbl>   <dbl>   <dbl> <dbl> <dbl>  <dbl>
## 1       2       4       1     1    78      1
## 2       3       1       5     0    30      1
## 3       3       4       1     0    72      1
## 4       3       4       2     0    64      1
## 5       3       1       1     0    59      1
## 6       2       1       5     0    25      0
```

* If we just want a list of the names of the variables in the data set, we can use the `names()` function:

``` r
names(nmes_data)
```

```
##  [1] "id"        "totalexp"  "lc5"       "chd5"      "eversmk"   "current"  
##  [7] "former"    "packyears" "yearsince" "bmi"       "beltuse"   "educate"  
## [13] "marital"   "poor"      "age"       "female"
```

## Question 1.1: How does the risk of disease compare for smokers and otherwise similar non-smokers?

To answer this question, we might start by making some displays of our data. 

**First, suppose we simply wanted to compare the risk of disease between smokers and non-smokers.**  We could display this comparison in either a table or a graph.

### Bar graphs

First let's consider some bar graphs.  What does each graph show us?  Do any of these graphs help us compare the risk of disease between smokers and non-smokers?


``` r
ggplot(data = nmes_data) + 
  geom_bar(mapping = aes(x = eversmk))
```

![](Module1_Class1_files/figure-html/unnamed-chunk-7-1.png)<!-- -->


``` r
ggplot(data = nmes_data) + 
  geom_bar(mapping = aes(x = eversmk, y = stat(prop)))
```

```
## Warning: `stat(prop)` was deprecated in ggplot2 3.4.0.
## ℹ Please use `after_stat(prop)` instead.
## This warning is displayed once every 8 hours.
## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
## generated.
```

![](Module1_Class1_files/figure-html/unnamed-chunk-8-1.png)<!-- -->


``` r
ggplot(data = nmes_data) + 
  geom_bar(mapping = aes(x = lc5))
```

![](Module1_Class1_files/figure-html/unnamed-chunk-9-1.png)<!-- -->


``` r
ggplot(data = nmes_data) + 
  geom_bar(mapping = aes(x = lc5, y = stat(prop)))
```

![](Module1_Class1_files/figure-html/unnamed-chunk-10-1.png)<!-- -->

It might be helpful if we re-code the values of 0 and 1 to have more meaningful labels.  We can do this by turning these two numeric variables into factor variables with meaningful labels:


``` r
nmes_data <- nmes_data %>%
  mutate(eversmk = factor(eversmk, levels = c("0", "1"), labels = c("Never smoker", "Ever smoker")),
         lc5 = factor(lc5, levels = c("0", "1"), labels = c("No LC", "LC"))
         )
```

Let's look at one of our proportion plots again:

``` r
ggplot(data = nmes_data) + 
  geom_bar(mapping = aes(x = eversmk, y = stat(prop)))
```

![](Module1_Class1_files/figure-html/unnamed-chunk-12-1.png)<!-- -->

Both of the proportions are 1?!  This is because now that our variable is a factor variable, we also have to specify which groups we want to calculate the proportions relative to. If we want the proportions overall, we use `group = 1`:

``` r
ggplot(data = nmes_data) + 
  geom_bar(mapping = aes(x = eversmk, y = stat(prop), group = 1))
```

![](Module1_Class1_files/figure-html/unnamed-chunk-13-1.png)<!-- -->


``` r
ggplot(data = nmes_data) + 
  geom_bar(mapping = aes(x = lc5, y = stat(prop), group = 1))
```

![](Module1_Class1_files/figure-html/unnamed-chunk-14-1.png)<!-- -->

We've made these plots look nicer, but are they helping us to answer our question? How can we include both variables together in the same graph?  We can do this by mapping the second variable to `fill` in our graph:


``` r
ggplot(data = nmes_data) + 
  geom_bar(mapping = aes(x = lc5, fill = eversmk))
```

![](Module1_Class1_files/figure-html/unnamed-chunk-15-1.png)<!-- -->

We can make this look even nicer by adjusting the position of the bars.  We can place them next to each other with `position = "dodge"`:


``` r
ggplot(data = nmes_data) + 
  geom_bar(mapping = aes(x = lc5, y = stat(prop), fill = eversmk), position = "dodge")
```

![](Module1_Class1_files/figure-html/unnamed-chunk-16-1.png)<!-- -->

``` r
ggplot(data = nmes_data) + 
  geom_bar(mapping = aes(x = lc5, y = stat(prop), group = eversmk, fill = eversmk), position = "dodge")
```

![](Module1_Class1_files/figure-html/unnamed-chunk-16-2.png)<!-- -->

Or we can stack them as proportions with `position = "fill"`:


``` r
ggplot(data = nmes_data) + 
  geom_bar(mapping = aes(x = lc5, fill = eversmk), position = "fill")
```

![](Module1_Class1_files/figure-html/unnamed-chunk-17-1.png)<!-- -->

Now we have the graphs with both the `lc5` and `eversmk` variables.  Can we now compare the risk of disease between smokers and non-smokers?

Let's make one more change:

``` r
ggplot(data = nmes_data) + 
  geom_bar(mapping = aes(x = eversmk, fill = lc5), position = "fill")
```

![](Module1_Class1_files/figure-html/unnamed-chunk-18-1.png)<!-- -->

Now, how would you say that this risk of disease compares for smokers and non-smokers?

### Tables

We could also look at these relationships using tables:

``` r
nmes_data %>%
  count(eversmk)
```

```
## # A tibble: 2 × 2
##   eversmk          n
##   <fct>        <int>
## 1 Never smoker  2084
## 2 Ever smoker   1994
```

``` r
nmes_data %>%
  count(lc5)
```

```
## # A tibble: 2 × 2
##   lc5       n
##   <fct> <int>
## 1 No LC  4033
## 2 LC       45
```

``` r
nmes_data %>%
  count(lc5, eversmk)
```

```
## # A tibble: 4 × 3
##   lc5   eversmk          n
##   <fct> <fct>        <int>
## 1 No LC Never smoker  2080
## 2 No LC Ever smoker   1953
## 3 LC    Never smoker     4
## 4 LC    Ever smoker     41
```

``` r
nmes_data %>%
  count(eversmk, lc5)
```

```
## # A tibble: 4 × 3
##   eversmk      lc5       n
##   <fct>        <fct> <int>
## 1 Never smoker No LC  2080
## 2 Never smoker LC        4
## 3 Ever smoker  No LC  1953
## 4 Ever smoker  LC       41
```

Do these tables help us compare the risk of disease for smokers and non-smokers?

To get proportions instead of counts, we can mutate our table to add a proportions column, defined as the value in the `n` column divided by the sum of the values in the `n` column.  Basically we are specifying a new column `prop = n/sum(n)`:

``` r
nmes_data %>%
  count(eversmk) %>%
  mutate(prop = n/sum(n))
```

```
## # A tibble: 2 × 3
##   eversmk          n  prop
##   <fct>        <int> <dbl>
## 1 Never smoker  2084 0.511
## 2 Ever smoker   1994 0.489
```

Let's do this for all of our tables:

``` r
nmes_data %>%
  count(eversmk) %>%
  mutate(prop = n/sum(n))
```

```
## # A tibble: 2 × 3
##   eversmk          n  prop
##   <fct>        <int> <dbl>
## 1 Never smoker  2084 0.511
## 2 Ever smoker   1994 0.489
```

``` r
nmes_data %>%
  count(lc5) %>%
  mutate(prop = n/sum(n))
```

```
## # A tibble: 2 × 3
##   lc5       n   prop
##   <fct> <int>  <dbl>
## 1 No LC  4033 0.989 
## 2 LC       45 0.0110
```

``` r
nmes_data %>%
  count(lc5, eversmk) %>%
  mutate(prop = n/sum(n))
```

```
## # A tibble: 4 × 4
##   lc5   eversmk          n     prop
##   <fct> <fct>        <int>    <dbl>
## 1 No LC Never smoker  2080 0.510   
## 2 No LC Ever smoker   1953 0.479   
## 3 LC    Never smoker     4 0.000981
## 4 LC    Ever smoker     41 0.0101
```

``` r
nmes_data %>%
  count(eversmk, lc5) %>%
  mutate(prop = n/sum(n))
```

```
## # A tibble: 4 × 4
##   eversmk      lc5       n     prop
##   <fct>        <fct> <int>    <dbl>
## 1 Never smoker No LC  2080 0.510   
## 2 Never smoker LC        4 0.000981
## 3 Ever smoker  No LC  1953 0.479   
## 4 Ever smoker  LC       41 0.0101
```

Do these new tables allow us to compare the risk of disease for smokers and non-smokers?  

What we really want is a table where the proportions add up to 1 within the smoking groups, not across all four of the groups.  We can do this by using the `group_by()` option.  If we group by `lc5`, then our proportions add up to 1 within the LC groups.  If we group by `eversmk`, then our proportions add up to 1 within the smoking groups:

``` r
nmes_data %>%
  count(lc5, eversmk) %>%
  group_by(lc5) %>%
  mutate(prop = n/sum(n))
```

```
## # A tibble: 4 × 4
## # Groups:   lc5 [2]
##   lc5   eversmk          n   prop
##   <fct> <fct>        <int>  <dbl>
## 1 No LC Never smoker  2080 0.516 
## 2 No LC Ever smoker   1953 0.484 
## 3 LC    Never smoker     4 0.0889
## 4 LC    Ever smoker     41 0.911
```

``` r
nmes_data %>%
  count(lc5, eversmk) %>%
  group_by(eversmk) %>%
  mutate(prop = n/sum(n))
```

```
## # A tibble: 4 × 4
## # Groups:   eversmk [2]
##   lc5   eversmk          n    prop
##   <fct> <fct>        <int>   <dbl>
## 1 No LC Never smoker  2080 0.998  
## 2 No LC Ever smoker   1953 0.979  
## 3 LC    Never smoker     4 0.00192
## 4 LC    Ever smoker     41 0.0206
```

Which one of these is the one we want if our goal is to compare the risk of disease between smokers and non-smokers?

Note: we can make our tables prettier by using the `kable()` function from the `knitr` package.  Again we have already installed the `knitr` package in our shared workspace, so we only have to load it before we can use it:

``` r
library(knitr)

nmes_data %>%
  count(lc5, eversmk) %>%
  group_by(eversmk) %>%
  mutate(prop = n/sum(n)) %>%
  kable()
```



|lc5   |eversmk      |    n|      prop|
|:-----|:------------|----:|---------:|
|No LC |Never smoker | 2080| 0.9980806|
|No LC |Ever smoker  | 1953| 0.9794383|
|LC    |Never smoker |    4| 0.0019194|
|LC    |Ever smoker  |   41| 0.0205617|

``` r
nmes_data %>%
  count(lc5, eversmk) %>%
  group_by(eversmk) %>%
  mutate(prop = n/sum(n)) %>%
  kable(digits = 3)
```



|lc5   |eversmk      |    n|  prop|
|:-----|:------------|----:|-----:|
|No LC |Never smoker | 2080| 0.998|
|No LC |Ever smoker  | 1953| 0.979|
|LC    |Never smoker |    4| 0.002|
|LC    |Ever smoker  |   41| 0.021|

### Bar graphs from tables

Both these bar graphs and these tables can show the same information about the relationship between smoking and disease.  However you can have more control of what it is your bar graph if you first create a table with the values you want to graph and then graph from this table instead of the entire data set!


``` r
my_table <- nmes_data %>%
  count(lc5, eversmk) %>%
  group_by(eversmk) %>%
  mutate(prop = n/sum(n))

my_table
```

```
## # A tibble: 4 × 4
## # Groups:   eversmk [2]
##   lc5   eversmk          n    prop
##   <fct> <fct>        <int>   <dbl>
## 1 No LC Never smoker  2080 0.998  
## 2 No LC Ever smoker   1953 0.979  
## 3 LC    Never smoker     4 0.00192
## 4 LC    Ever smoker     41 0.0206
```

Now we've created a table that gives the proportion of those with and without lung cancer in each smoking category.  (Note the proportions add up to 1 within the smoking groups!)

We can now graph this by setting the `y` aesthetic to the `prop` variable in this table and choosing `stat = "identity"` within `geom_bar()` to say we are directly giving the `y` value to be plotted rather than having R calculate either the proportion or count for us.

``` r
ggplot(data = my_table) + 
  geom_bar(aes(x = eversmk, y = prop, fill = lc5), stat = "identity", position = "stack")
```

![](Module1_Class1_files/figure-html/unnamed-chunk-25-1.png)<!-- -->

Confirm that this matches our earlier bar graph using `geom_bar()`:

``` r
ggplot(data = nmes_data) + 
  geom_bar(mapping = aes(x = eversmk, fill = lc5), position = "fill")
```

![](Module1_Class1_files/figure-html/unnamed-chunk-26-1.png)<!-- -->

Working with a table, we can easily switch from a stacked bar graph to a side-by-side bar graph by changing `position = "stack"` to `position = "dodge"`):

``` r
ggplot(data = my_table) + 
  geom_bar(aes(x = eversmk, y = prop, fill = lc5), stat = "identity", position = "dodge")
```

![](Module1_Class1_files/figure-html/unnamed-chunk-27-1.png)<!-- -->

And there's other flexibility as well, which we will see as the course progresses.  In general, my recommendation for bar graphs is to first create a table with the values you want to graph and **then** create the graph.  This gives you much more control!

## Now about the "otherwise similar" part!

We have made some data displays that allow us to compare the risk of disease between smokers and non-smokers.  But we really want to compare the risk of disease between smokers and **otherwise similar** non-smokers.

On Wednesday we will talk about incorporating this "otherwise similar" concept into our graphical displays and spend time working on the first assignment which will be due on Sunday evening.

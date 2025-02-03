---
title: "Class 1-4: Discussion of results for Question 1-1"
author: "Health Data Analysis Practicum (AS.280.347)"
date: "February 3, 2025"
output: 
  html_document:
    toc: true
    toc_float: 
      toc_collapsed: true
    toc_depth: 3
    number_sections: false
    keep_md: yes
---



## Preliminaries

Again, first we load the packages that we will be using in this document.  It's good practices to load packages as the beginning so they are all in the same place.  If you decide later you need an additional package, add it to the top of the document!

``` r
library(tidyverse)  # core group of tidyverse packages
library(kableExtra)  # to make nice tables
library(broom)   # for tidy model output
```

## Module 1: Smoking and the risk of disease

Questions of interest:

* **Question 1.1: ** How does the risk of disease compare for smokers and otherwise similar non-smokers?

<center>
![](Q1_dag.png){width=500px}
</center>

* **Queston 1.2: ** Does the contribution of smoking to the risk of disease vary by sex or socio-economic status (SES)?

<center>
![](Q2_dag.png){width=500px}
</center>

To address each question we want:

* A data display (graph or table)
* A statistical analysis (with interprepration)

We will answer these questions using data from the National Medical Expenditures Survey (NMES)

## Discussion of NMES logistic regression results for Question 1-1

In your breakout groups, take 20-25 minutes to discuss the following sets of logistic regression results and interpretations.  Looking at all 7 sets of results/interpretations, answer the following questions:

(1) In order to address the comparison of interest between smokers and non-smokers, which variable **must** be included in the model?

(2) In order to allow for comparison between smokers and **otherwise similar** non-smokers, what must be included in the model?  What must be included in the interpretation?

(3) To address our question of interest, should we interpret **all** the coefficients in the regression model?  Or just some of them?

(4) To address our question of interest, is it better to present/interpret the regression coefficients or the odds ratios?

(5) To address our question of interest, how can we include information about the significance of the relationship of interest in our interpretation?

(6) If you were to create a nice succinct table of results to communicate the relevant information from the R output to the reader, what pieces of information would you include? What could be excluded?  What aesthetic choices would you make when presenting the information in the table and in the text?

(7) For a variable like age, should we include it in our regression model in its continuous form or in a categorical form?  Why?

(8) Should the variables used to determine "otherwise similar" in the regression model match the variables used to determine "otherwise similar" in the data display (graph)?  Why or why not?

(9) We would like you to be **numerate** in your interpretations of your analysis results.  What do we mean by numerate and which interpretations below do a good job of being numerate?

(10) Are there any interpretations or results shown below that you think are technically incorrect? Are there some that you particularly like? Which ones sound the most like something you think you would read in a scientific publication?


### Results 1

**Smokers have a 70.9% higher odds of MSCD compared to non-smokers holding other variable constant. Female have 33.5% lower odds of MSCD compared to male holding other variable constant. Having a low socioeconomic status have a 5 times higher odd of having MSCD compared to having a high socioeconomic status holding other variable constant. **





``` r
model<- glm(mscd ~ eversmk + female + poor, 
              family = binomial(link = "logit"), 
              data = nmes_data)
model%>%
tidy(exponentiate = TRUE, conf.int = TRUE, conf.level = 0.96) %>%
  filter(term != "(Intercept)") %>%
  mutate(conf.int = paste0("(", round(conf.low, 2), ", ", round(conf.high,2), ")"),
    term = gsub("femaleFemale", "Female", term),
    term = gsub("eversmkEver smoker", "Ever smoker", term),
    term = gsub("poorPoor", "Poor", term)
         ) %>%
  select(Term = term, OR = estimate, `p-value` = p.value, `95% CI` = conf.int) %>%
  kable(digits = 3, format = "markdown")
```



|Term        |    OR| p-value|95% CI       |
|:-----------|-----:|-------:|:------------|
|Ever smoker | 1.709|   0.000|(1.3, 2.27)  |
|Female      | 0.665|   0.002|(0.51, 0.87) |
|Poor        | 5.109|   0.000|(3.93, 6.67) |


### Results 2

**My logistic regression model shows that adjusting for sex and socio-economic status, the odds of having an MSCD is 70.9% higher for ever smokers than for nonsmokers. The p-value is lower than 0.05, which means that this correlation is statistically significant.**




``` r
model1 <- glm(mscd ~ eversmk + female + poor, 
              family=binomial(link="logit"), 
              data=nmes_data)

model1 %>%
  tidy(exponentiate = TRUE, conf.int = TRUE, conf.level = 0.95) %>%
  filter(term != "(Intercept)") %>%
  mutate(conf.int = paste0("(", round(conf.low, 2), ", ", round(conf.high, 2), ")")) %>%
  select(Term = term, OR = estimate, `p-value` = p.value, `95% CI` = conf.int) %>%
  kable(digits = 3, format = "markdown")
```



|Term               |    OR| p-value|95% CI       |
|:------------------|-----:|-------:|:------------|
|eversmkEver smoker | 1.709|   0.000|(1.31, 2.24) |
|femaleFemale       | 0.665|   0.002|(0.51, 0.86) |
|poorPoor           | 5.109|   0.000|(3.97, 6.59) |

### Results 3


**Based on the outputs of this regression model, it can be inferred that holding sex, education level, and marital status constant, the odds that eversmokers develops MSCD (lung cancer or CHD) is 1.712 times higher than nonsmokers. The p-values is lower than 0.05, which means this correlation is statistically significant, adjusting for the covariates.**




What do you notice about the marital variable in this model output?


``` r
# code for logistic regression

# code for logistic regression
modellc5 <- glm(mscd ~ eversmk + female + educate + marital,
                family=binomial(link="logit"),
                data=nmes_data)

# better presentation (class 3)
modellc5 %>%
  tidy(exponentiate = TRUE, conf.int = TRUE, conf.level = 0.95) %>%
  mutate(conf.int = paste0("(", round(conf.low, 2), ", ", round(conf.high,2), ")")) %>%
  select(Term = term, OR = estimate, `p-value` = p.value, `95% CI` = conf.int) %>%
  kable(digits = 3, format = "markdown")
```



|Term        |    OR| p-value|95% CI       |
|:-----------|-----:|-------:|:------------|
|(Intercept) | 0.033|   0.000|(0.02, 0.05) |
|eversmk     | 1.712|   0.000|(1.32, 2.23) |
|female      | 0.705|   0.007|(0.55, 0.91) |
|educate     | 1.408|   0.000|(1.22, 1.63) |
|marital     | 0.872|   0.004|(0.79, 0.96) |

### Results 4

NOTE: The model interpretation is located below the model fitting for a specific reason. Can you figure out why?




``` r
class_weights <- ifelse(nmes_data[["mscd_binary"]] == 1,
                        sum(nmes_data[["mscd_binary"]] == 0) / sum(nmes_data[["mscd_binary"]] == 1),
                        1) %>% 
      round()


model <- glm("mscd_binary ~ eversmk + age + female + poor", data = nmes_data,family = "binomial", weights = class_weights)


# new plot
tidy_model <- broom::tidy(model, conf.int = TRUE, exp = TRUE) %>% 
      filter(term != "(Intercept)") %>% 
      mutate(
                  significance = case_when(
                        p.value < 0.05 & estimate < 1 ~ "Significant Protection",
                        p.value < 0.05 & estimate > 1 ~ "Significant Risk",
                        TRUE ~ "Not Significant"
                  )
            ) %>% 
      mutate(term = forcats::fct_reorder(term, estimate))


broom::tidy(model) %>% 
      filter(term != "(Intercept)") %>% 
      mutate(exp_coefficient = exp(estimate)) %>% 
      select(term = term, coefficient = estimate, 'Adjusted OR' = exp_coefficient,'standard error' = std.error, 'p-value' = p.value) %>% 
      knitr::kable(digits = 3, format = "markdown")
```



|term    | coefficient| Adjusted OR| standard error| p-value|
|:-------|-----------:|-----------:|--------------:|-------:|
|eversmk |       0.575|       1.777|          0.061|       0|
|age     |       0.071|       1.074|          0.002|       0|
|female  |      -0.299|       0.742|          0.061|       0|
|poor    |       0.794|       2.212|          0.061|       0|

**The Odds Ratio of mscd by the eversmk variable, holding age, female, and poor variables constant is approximately 1.78. This means that the odds of a smoker having mscd is 1.78 times higher than that of a nonsmoker, after holding the aforementioned variables constant.**


Can anyone figure out why the bars here are blue instead of the default color?


``` r
temp <- temp %>%
      mutate(age_category = case_when(
            age < 44 ~ "<44 years",
            age >= 44 ~ ">=44 years"
      )) %>% 
      count(age_category, poor, mscd, eversmk) %>%
      group_by(age_category, poor, eversmk) %>%
      mutate(prop = n / sum(n))
      

temp %>%
      filter(mscd > 0) %>%
      ggplot() +
      geom_bar(aes(x = eversmk, y = prop, fill = mscd), stat = "identity") +
      facet_grid(poor ~ age_category) +
      labs(
            title = "MSCD Rate",
            subtitle = "Smokers vs non-smokers, stratified by age category and socio-economic status",
            x = "Smoking status",
            y = "Rate of MSCD"
      ) +
      guides(fill = "none")
```

![](Module1_Class4_files/figure-html/results4viz-1.png)<!-- -->


### Results 5

**The odds risk column shows us that smokers are 1.81 times more likely to have mscd than non-smokers. The regression also shows that women (based on this dataset) have 30% lower odds of having an mscd. Since the p values for smoking status and gender are <0.05, we can conclude that the predictors are statistically significant with mscd status.**






``` r
model1<- glm(mscd ~ eversmk + female, family=binomial(link="logit"), data=nmesPROC)

model1 %>%
  tidy(exponentiate = TRUE, conf.int = TRUE, conf.level = 0.95) %>%
  mutate(conf.int = paste0("(", round(conf.low, 2), ", ", round(conf.high, 2),")")) %>%
  select(Term = term, OR = estimate, `p-value` = p.value, `95% CI` = conf.int) %>%
  kable(digits = 3, format = "markdown")
```



|Term         |    OR| p-value|95% CI       |
|:------------|-----:|-------:|:------------|
|(Intercept)  | 0.064|   0.000|(0.05, 0.08) |
|eversmkYes   | 1.808|   0.000|(1.4, 2.35)  |
|femaleFemale | 0.701|   0.005|(0.55, 0.9)  |


### Results 6


**The logistic regression analysis examines the association between smoking status, gender, and socioeconomic status with the likelihood of developing coronary heart disease (CHD). The results indicate that individuals who have ever smoked have 1.38 times higher odds of developing CHD compared to never smokers (OR = 1.377, 95% CI: 1.041 - 1.827), suggesting a statistically significant increase in risk. Gender appears to play a role, as females have 22.3% lower odds of CHD compared to males (OR = 0.777, 95% CI: 0.589 - 1.029), but this result is not statistically significant, meaning we cannot conclude with confidence that gender is a protective factor. In contrast, socioeconomic status is a strong predictor of CHD, with poor individuals having 4.19 times higher odds of CHD compared to non-poor individuals (OR = 4.188, 95% CI: 3.199 - 5.494). Since the confidence interval does not include 1, this effect is highly significant, highlighting the substantial impact of socioeconomic disparities on cardiovascular health. These findings suggest that both smoking and poverty are important risk factors for CHD, with poverty having the strongest association in this model.**





``` r
model <- glm(chd5 ~ eversmk + female + poor, data = nmes_data, family = binomial)
results_table <- tidy(model, conf.int = TRUE, exponentiate = TRUE) %>%
  filter(term != "(Intercept)") %>%  
  mutate(
    term = case_when(
      term == "eversmkEver smoker" ~ "Ever Smoker vs Never",
      term == "femaleFemale" ~ "Female vs Male",
      term == "poorPoor" ~ "Poor vs Not Poor",
      TRUE ~ term
    ),
    across(c(estimate, conf.low, conf.high), ~ round(., 2)),
    `p-value` = scales::pvalue(p.value)
  ) %>%
  select(
    Predictor = term,
    `Odds Ratio` = estimate,
    `Lower CI` = conf.low,
    `Upper CI` = conf.high,
    `p-value`
  )
results_table %>%
  kable(
    caption = "Logistic Regression Results for Coronary Heart Disease (CHD)",
    align = c("l", "c", "c", "c", "c"),
    digits = 2
  ) %>%
  kable_styling(
    bootstrap_options = c("striped", "hover", "condensed"),
    full_width = FALSE,
    position = "center"
  ) 
```

<table class="table table-striped table-hover table-condensed" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Logistic Regression Results for Coronary Heart Disease (CHD)</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Predictor </th>
   <th style="text-align:center;"> Odds Ratio </th>
   <th style="text-align:center;"> Lower CI </th>
   <th style="text-align:center;"> Upper CI </th>
   <th style="text-align:center;"> p-value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Ever Smoker vs Never </td>
   <td style="text-align:center;"> 1.38 </td>
   <td style="text-align:center;"> 1.04 </td>
   <td style="text-align:center;"> 1.83 </td>
   <td style="text-align:center;"> 0.025 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Female vs Male </td>
   <td style="text-align:center;"> 0.78 </td>
   <td style="text-align:center;"> 0.59 </td>
   <td style="text-align:center;"> 1.03 </td>
   <td style="text-align:center;"> 0.077 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Poor vs Not Poor </td>
   <td style="text-align:center;"> 4.19 </td>
   <td style="text-align:center;"> 3.20 </td>
   <td style="text-align:center;"> 5.49 </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
</tbody>
</table>



### Results 7

**The poor OR tells us that those that are poor have 5.109 times higher odds to have disease compared to those that are not poor. This is statistically significant since the p-value is ~0. This means that if you are poor, you are far more likely to be diseased.
The female OR tells us that females have a 33.5% lower odds to have disease compared to males. This is statistically significant since the p-value is 0.002. This means that if you are born female, you are less likely to be diseased.
The Ever smoker OR tells us that those that smoke have 1.709 higher odds to have disease compared to those who don't smoke. This is statistically significant since the p-value is ~0. This means that if you smoke, you are more likely to be diseased.**




``` r
model1 <- glm(disease ~ poor + female + eversmk, 
              family=binomial(link="logit"), 
              data=nmes_data)
model1 %>%
  tidy(exponentiate = TRUE, conf.int = TRUE, conf.level = 0.95) %>%
  filter(term != "(Intercept)") %>%
  mutate(
    term = recode(term, 
                  "poorPoor" = "Poor", 
                  "femaleFemale" = "Female", 
                  "eversmkEver smoker" = "Ever Smoker"),
    conf.int = paste0("(", round(conf.low, 2), ", ", round(conf.high, 2), ")")
  ) %>%
  select(Term = term, OR = estimate, `p-value` = p.value, `95% CI` = conf.int) %>%
  kable(digits = 3, format = "markdown")
```



|Term        |    OR| p-value|95% CI       |
|:-----------|-----:|-------:|:------------|
|Poor        | 5.109|   0.000|(3.97, 6.59) |
|Female      | 0.665|   0.002|(0.51, 0.86) |
|Ever Smoker | 1.709|   0.000|(1.31, 2.24) |



### Results 8 (just a couple of revised visualizations)




A revised plot I thought folks might want to see:


``` r
my_table <- nmes_data %>%
  count(eversmk, poor, age, mscd) %>%
  group_by(poor, age, eversmk) %>%
  mutate(prop = n / sum(n))  

my_table %>%
  filter(mscd == 'MSCD') %>%
  ggplot(aes(x = eversmk, y = prop, fill = mscd)) +
  geom_col() +  
  facet_grid(poor ~ age) +
  labs(
    title = "LC5 Proportions among Individuals in the NMES Dataset",
    subtitle = "Compared between Smokers and Non-Smokers, Stratified by Poverty Status and Age Group",
    x = "Ever Smoked", fill = "Category", y = "Proportion") +
  theme_minimal()
```

![](Module1_Class4_files/figure-html/results8plot-1.png)<!-- -->

And another (actually from a student from last year):




``` r
nmes_table <- nmes_data %>%
  count(eversmk,disease,female, poor)%>%
  group_by(eversmk,female, poor)%>%
  mutate(percent=n/sum(n)*100)

### Plots the graph
nmes_table %>%
  filter (disease == "Disease")%>%
  ggplot()+ 
  geom_bar(aes(x = eversmk, y = percent, fill=disease), fill = "lightblue", stat="identity")+
  facet_grid(female~poor)+
  theme_bw(base_size=8.5)+
  geom_text(aes(x=eversmk, y= percent, label=round(percent, digits=2), vjust=1.5))+
  labs(y = "Risk of Major Smoking Caused Diseases (%)",
       x = "Ever Smoked",
       title = "Risk of Major Smoking Caused Diseases (MSCD), Comparing Smokers to Non-Smokers",
       subtitle = "N = Never Smoked, Y = Ever Smoked")+
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))
```

![](Module1_Class4_files/figure-html/results8bplot-1.png)<!-- -->

``` r
### Plots the graph - sample sizes instead
nmes_table %>%
  filter (disease == "Disease")%>%
  ggplot()+ 
  geom_bar(aes(x = eversmk, y = percent, fill=disease), fill = "lightblue", stat="identity")+
  facet_grid(female~poor)+
  theme_bw(base_size=8.5)+
  geom_text(aes(x=eversmk, y= percent, label=paste0("n = ", n), vjust=1.5))+
  labs(y = "Risk of Major Smoking Caused Diseases (%)",
       x = "Ever Smoked",
       title = "Risk of Major Smoking Caused Diseases (MSCD), Comparing Smokers to Non-Smokers",
       subtitle = "N = Never Smoked, Y = Ever Smoked")+
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))
```

![](Module1_Class4_files/figure-html/results8bplot-2.png)<!-- -->


## R notes based Assignment 1-2

We're including some notes here on aesthetics for improving your tables/displays as we start to work to a final project report.  You should also feel free to ask questions on Piazza if there is something you would like us to help you learn how to do!

### Recoding the data

``` r
nmes_data <- read_csv("module_1/nmesUNPROC.csv")

nmes_data <- nmes_data %>%
  mutate(eversmk = factor(eversmk, levels = c("0", "1"), labels = c("Never smoker", "Ever smoker")),
         lc5 = factor(lc5, levels = c("0", "1"), labels = c("No LC", "LC")),
         chd5 = factor(chd5, levels = c("0", "1"), labels = c("No CHD", "CHD")),
         female = factor(female, levels= c("0", "1"), labels = c("Male", "Female")),
         current = factor(current, levels= c("0", "1"), labels = c("Not current smoker", "Current smoker")),
         former = factor(former, levels= c("0", "1"), labels = c("Not former smoker", "Former smoker")),
         beltuse = factor(beltuse, levels= c("1", "2", "3"), labels = c("Rare", "Some", "Almost always")),
         educate = factor(educate, levels= c("1", "2", "3", "4"), labels = c("College grad", "Some college", "HS grad", "Other")),
         marital = factor(marital, levels= c("1", "2", "3", "4", "5"), labels = c("Married", "Widowed", "Divorced", "Separated", "Never married")),
         poor = factor(poor, levels= c("0", "1"), labels = c("Not poor", "Poor"))
         )

nmes_data <- nmes_data %>%
  mutate(disease = factor(lc5 == "LC" | chd5 == "CHD", 
                          levels=c(FALSE,TRUE), 
                          labels=c("No MSCD", "MSCD")))
```

### Using knitr/kableExtra and the pander package for tables

We already talked about using the `kable()` function (from the `knitr` package) to make your tables look nicer:

Original:

``` r
nmes_data %>%
  count(disease)
```

```
## # A tibble: 2 × 2
##   disease     n
##   <fct>   <int>
## 1 No MSCD  3801
## 2 MSCD      277
```

Nicer:

``` r
nmes_data %>%
  count(disease) %>%
  kable(format = "pipe")
```



|disease |    n|
|:-------|----:|
|No MSCD | 3801|
|MSCD    |  277|

You can also add a caption to a table directly with the `kable()` function:

``` r
nmes_data %>%
  count(disease) %>%
  kable(format = "pipe",
        caption = "Table 1: Number of individuals with and without Major smoking-caused disease")
```



Table: Table 1: Number of individuals with and without Major smoking-caused disease

|disease |    n|
|:-------|----:|
|No MSCD | 3801|
|MSCD    |  277|

And you can change the number of decimals displayed in the table pretty easily as well.  Generally displaying only 3 significant figures in your tables is a good idea when you have values that include decimals.

``` r
nmes_data %>%
  count(eversmk, disease) %>%
  group_by(eversmk) %>%
  mutate(prop = n/sum(n)) %>%
  filter(disease == "MSCD") %>%
  kable(format = "pipe",
        caption = "Table 2: Proportions of individuals with and without a MSCD by smoking status",
        digits=3)
```



Table: Table 2: Proportions of individuals with and without a MSCD by smoking status

|eversmk      |disease |   n|  prop|
|:------------|:-------|---:|-----:|
|Never smoker |MSCD    | 100| 0.048|
|Ever smoker  |MSCD    | 177| 0.089|

You can find lots of information about fine-tuning tables using `kable()` and the `kableExtra` package [here](https://bookdown.org/yihui/rmarkdown-cookbook/tables.html).

There is also another package called `pander` which makes nice tables. You can install `pander` by running `install.packages("pander")`.  It works very similarly to `kable()` and you can find more information on how to modify settings [here](http://rapporter.github.io/pander/).


``` r
library(pander)  # usually you would want to put this at the top of your document
nmes_data %>%
  count(eversmk, disease) %>%
  group_by(eversmk) %>%
  mutate(prop = n/sum(n)) %>%
  filter(disease == "MSCD") %>%
  pander(caption = "Table 2: Proportions of individuals with and without a MSCD by smoking status",
        digits=3)
```


---------------------------------------
   eversmk      disease    n     prop  
-------------- --------- ----- --------
 Never smoker    MSCD     100   0.048  

 Ever smoker     MSCD     177   0.0888 
---------------------------------------

Table: Table 2: Proportions of individuals with and without a MSCD by smoking status

To nicely display regression model output in a table, you can first store the results in a tidy format that can be manipulated like any other table/data in R. This is easy to do using the `tidy()` function from the `broom` package in R.  Remember, you'll have to use `install.packages("broom")` the first time you use it.


``` r
library(broom)  # usually you would want to put this at the top of your document

my_model <- glm(disease ~ eversmk + age + female, family=binomial(link="logit"), data=nmes_data)
tidy(my_model)
```

```
## # A tibble: 4 × 5
##   term               estimate std.error statistic  p.value
##   <chr>                 <dbl>     <dbl>     <dbl>    <dbl>
## 1 (Intercept)         -7.13     0.351      -20.3  1.67e-91
## 2 eversmkEver smoker   0.791    0.148        5.35 8.68e- 8
## 3 age                  0.0737   0.00458     16.1  2.31e-58
## 4 femaleFemale        -0.307    0.141       -2.18 2.96e- 2
```

In this tidy version of the model output, you see the results are arranged as a data set with variables names `term`, `estimate`, `std.error`, `statistic`, and `p.value`.  You can put this into a nicer table form using `kable()` or `pander()`, but can also easily change column names and add/remove columns and rows:

``` r
my_model <- glm(disease ~ eversmk + age + female, family=binomial(link="logit"), data=nmes_data)
my_model_results <- tidy(my_model)

my_model_results %>%
  kable(format = "pipe",
        digits = 3)
```



|term               | estimate| std.error| statistic| p.value|
|:------------------|--------:|---------:|---------:|-------:|
|(Intercept)        |   -7.130|     0.351|   -20.287|    0.00|
|eversmkEver smoker |    0.791|     0.148|     5.352|    0.00|
|age                |    0.074|     0.005|    16.106|    0.00|
|femaleFemale       |   -0.307|     0.141|    -2.175|    0.03|

``` r
my_model_results %>%
  mutate(odds.ratio = exp(estimate)) %>%  # add a column with the odds ratios
  filter(term != "(Intercept)") %>% # remove the row with the intercept
  select(Variable = term, `Odds Ratio` = odds.ratio, `p-value` = p.value ) %>% # select only the columns we want, rearrange columns, and change names
  kable(format = "pipe",
        digits = 3)
```



|Variable           | Odds Ratio| p-value|
|:------------------|----------:|-------:|
|eversmkEver smoker |      2.207|    0.00|
|age                |      1.077|    0.00|
|femaleFemale       |      0.736|    0.03|

Some of these things can be done automatically with options in the `tidy()` function.  You can see more options using `?tidy.glm`.

``` r
my_model_results <- tidy(my_model, 
                         exponentiate = TRUE,
                         conf.int = TRUE)

my_model_results
```

```
## # A tibble: 4 × 7
##   term               estimate std.error statistic  p.value conf.low conf.high
##   <chr>                 <dbl>     <dbl>     <dbl>    <dbl>    <dbl>     <dbl>
## 1 (Intercept)        0.000801   0.351      -20.3  1.67e-91 0.000393   0.00156
## 2 eversmkEver smoker 2.21       0.148        5.35 8.68e- 8 1.66       2.96   
## 3 age                1.08       0.00458     16.1  2.31e-58 1.07       1.09   
## 4 femaleFemale       0.736      0.141       -2.18 2.96e- 2 0.558      0.970
```

``` r
my_model_results %>%
  filter(term != "(Intercept)") %>% # remove the row with the intercept
  mutate(conf.int = paste0("(", round(conf.low, 2), ", ", round(conf.high, 2), ")")) %>% # combine the CI terms together into nice format 
  select(Variable = term, `Odds Ratio` = estimate, `p-value` = p.value, `95% Confidence Interval` = conf.int) %>% # select only the columns we want, rearrange columns, and change names
  kable(format = "pipe",
        digits = 3,
        align = c("l", "r", "r", "r"))
```



|Variable           | Odds Ratio| p-value| 95% Confidence Interval|
|:------------------|----------:|-------:|-----------------------:|
|eversmkEver smoker |      2.207|    0.00|            (1.66, 2.96)|
|age                |      1.077|    0.00|            (1.07, 1.09)|
|femaleFemale       |      0.736|    0.03|            (0.56, 0.97)|

You can also change the variable names as well (and see two other examples up above, which I actually like better):

``` r
my_model_results$term <- c("Intercept", "Ever smoker", "Age (years)", "Female")

my_model_results %>%
  filter(term != "Intercept") %>% # remove the row with the intercept
  mutate(conf.int = paste0("(", round(conf.low, 2), ", ", round(conf.high, 2), ")")) %>% # combine the CI terms together into nice format 
  select(Variable = term, `Odds Ratio` = estimate, `p-value` = p.value, `95% Confidence Interval` = conf.int) %>% # select only the columns we want, rearrange columns, and change names
  kable(format = "pipe",
        digits = 3,
        align = c("l", "r", "r", "r"))
```



|Variable    | Odds Ratio| p-value| 95% Confidence Interval|
|:-----------|----------:|-------:|-----------------------:|
|Ever smoker |      2.207|    0.00|            (1.66, 2.96)|
|Age (years) |      1.077|    0.00|            (1.07, 1.09)|
|Female      |      0.736|    0.03|            (0.56, 0.97)|

And reformat the p-values to print in scientific notation:

``` r
my_model_results$term <- c("Intercept", "Ever smoker", "Age (years)", "Female")

my_model_results %>%
  filter(term != "Intercept") %>% # remove the row with the intercept
  mutate(conf.int = paste0("(", round(conf.low, 2), ", ", round(conf.high, 2), ")"),
         p.value_format = format(p.value, scientific = TRUE, digits = 3)) %>% # combine the CI terms together into nice format 
  select(Variable = term, `Odds Ratio` = estimate, `p-value` = p.value_format, `95% Confidence Interval` = conf.int) %>% # select only the columns we want, rearrange columns, and change names
  kable(format = "pipe",
        digits = 3,
        align = c("l", "r", "r", "r"))
```



|Variable    | Odds Ratio|  p-value| 95% Confidence Interval|
|:-----------|----------:|--------:|-----------------------:|
|Ever smoker |      2.207| 8.68e-08|            (1.66, 2.96)|
|Age (years) |      1.077| 2.31e-58|            (1.07, 1.09)|
|Female      |      0.736| 2.96e-02|            (0.56, 0.97)|

### Making your report a little more readable

For your final assignment for this module, we will be asking you to write a report presenting your analysis with the answers to the questions posed. We want you to include all the code that you used for the analysis in the Rmd file, but not necessarily to print the output of the code to your html document. There are some very helpful tips for managing whether code and code output get printed to the screen to be found on the second page of this `rmarkdown` cheat sheet: https://rstudio.github.io/cheatsheets/html/rmarkdown.html

For example, if you want to create a table where you display the table, but not the code, you could put `echo=FALSE` in the top of the code chunk for that piece of code:

Table: Table 1: Logistic regression results

|Variable    | Odds Ratio| p-value| 95% Confidence Interval|
|:-----------|----------:|-------:|-----------------------:|
|Ever smoker |      2.207|    0.00|            (1.66, 2.96)|
|Age (years) |      1.077|    0.00|            (1.07, 1.09)|
|Female      |      0.736|    0.03|            (0.56, 0.97)|

Similarly, if you have a code chunk that includes necessary code (that needs to run) but you don't want to see the code or the result of running that code, you can use `echo=FALSE` and `include=FALSE` in the top of the code chunk.


There are some very helpful tips found here: http://kbroman.org/knitr_knutshell/pages/Rmarkdown.html

### Selecting colors for figures

If you want to control the colors you are using in your graphs, [this](https://www.r-graph-gallery.com/ggplot2-color.html) is a great detailed resource for seeing your options!

You can refer to a color in many different ways, but the easiest is by name.  You can see the complete list of 657 colors available in R by typing:

``` r
colors()
```

You can then assign the colors directly (if using only one color) or using the `scale_fill_manual()` function within your graph if you want different colors for different groups:

``` r
plot_data <- nmes_data %>%
  count(eversmk, disease) %>%
  group_by(eversmk) %>%
  mutate(prop = n/sum(n)) %>%
  filter(disease == "MSCD")

ggplot(plot_data) +
  geom_bar(aes(x=eversmk, y=prop),
           stat="identity", fill = "deeppink")
```

![](Module1_Class4_files/figure-html/colorexample-1.png)<!-- -->

``` r
ggplot(plot_data) +
  geom_bar(aes(x=eversmk, y=prop, fill = eversmk),
           stat="identity") +
  scale_fill_manual(values = c("deeppink", "chartreuse1"))
```

![](Module1_Class4_files/figure-html/colorexample-2.png)<!-- -->

Sometimes it's better to leave color choices to the professionals, who know which colors look good together.  If you load the `RColorBrewer` package with `install.packages("RColorBrewer")`, you can select from within a predetermined color palatte.  You can see these color palettes [here](https://www.r-graph-gallery.com/38-rcolorbrewers-palettes.html).  You apply them in a similar way as your manual colors:


``` r
library(RColorBrewer)
display.brewer.all() # to see all the colors
```

![](Module1_Class4_files/figure-html/brewerexample-1.png)<!-- -->

``` r
ggplot(plot_data) +
  geom_bar(aes(x=eversmk, y=prop, fill = eversmk),
           stat="identity") +
  scale_fill_brewer(palette = "Dark2")
```

![](Module1_Class4_files/figure-html/brewerexample-2.png)<!-- -->

### Adding labels to figure and changing themes

The cool thing about `ggplot2` is that everything just builds on top of what you've already accomplished, so if you want to change the background, you can just change the theme with one more short line of code. Here, we'll use `theme_bw()` to remove the default gray background. We'll then add an additional line of code to change the color of the bars using `scale_fill_manual()`. Finally, we will relabel the axes and title using `labs()`.


``` r
# Change the appearance of the plot
ggplot(plot_data) +
  geom_bar(aes(x=eversmk, y=prop, fill=eversmk), stat="identity") +
  theme_bw() +
  scale_fill_brewer(palette = "Dark2") +
  labs(y="Risk of MSCD",
       x="",
       title="Risk of MSCD, comparing smokers to non-smokers")
```

![](Module1_Class4_files/figure-html/themebw-1.png)<!-- -->

One more important piece of controlling the look of your plot in ggplot2 uses `theme()`. You can control the look of your graphing using the *many* arguments of theme. Here, we'll introduce how to change the axis text size; however, if you type `?theme` below, you'll see all of the things that can be changed on your plots using `theme()`. For a good demonstration of themes, see https://github.com/jrnold/ggthemes.


``` r
# Here, we'll start playing with font size
ggplot(plot_data) +
  geom_bar(aes(x=eversmk, y=prop, fill=eversmk), stat="identity") +
  theme_bw() +
  scale_fill_brewer(palette = "Dark2") +
  labs(y="Risk of MSCD",
       x="",
       title="Risk of MSCD, comparing smokers to non-smokers")+
  theme(axis.text=element_text(size=12))
```

![](Module1_Class4_files/figure-html/theme2-1.png)<!-- -->

Finally, here's a link to good resource about adding labels, text, scales, and themes to your graphics: https://r4ds.hadley.nz/communication.html


### Moving or removing legends  in a figure

Whenever you use an aesthetic like `color` or `fill` or `shape` in the `ggplot()` function, R will automatically create a legend to the right of the graph:

``` r
my_table <- nmes_data %>%
  count(disease, eversmk) %>%
  group_by(eversmk) %>%
  mutate(prop = n/sum(n))

ggplot(data = my_table) + 
  geom_bar(aes(x = eversmk, y = prop, fill = disease), stat = "identity", position = "dodge")
```

![](Module1_Class4_files/figure-html/legendexample-1.png)<!-- -->

You can change the name of this legend in the `labs()` function using the names of the aesthetic shown in the legend.  In this case, the legend shows the `fill` aesthetic, so we can rename it as follows:

``` r
ggplot(data = my_table) + 
  geom_bar(aes(x = eversmk, y = prop, fill = disease), stat = "identity", position = "dodge") +
  labs(fill = "MSCD status")
```

![](Module1_Class4_files/figure-html/legendname-1.png)<!-- -->

We can also move the legend to a different location using the `legend.position` option within the `theme()` function:

``` r
ggplot(data = my_table) + 
  geom_bar(aes(x = eversmk, y = prop, fill = disease), stat = "identity", position = "dodge") +
  labs(fill = "MSCD status") +
  theme(legend.position = "bottom")
```

![](Module1_Class4_files/figure-html/legendbottom-1.png)<!-- -->

Choices for the position can be `bottom`, `top`, `right`, `left`, or `none`.  The none option is especially useful when the legend doesn't add any useful information.  Consider the graph where we only show the risk of disease, not the risk of no disease:

``` r
my_table <- nmes_data %>%
  count(disease, eversmk) %>%
  group_by(eversmk) %>%
  mutate(prop = n/sum(n)) %>%
  filter(disease == "MSCD")

ggplot(data = my_table) + 
  geom_bar(aes(x = eversmk, y = prop, fill = disease), stat = "identity", position = "dodge") +
  labs(fill = "MSCD status")
```

![](Module1_Class4_files/figure-html/legend2-1.png)<!-- -->

The legend on the side is not useful since there's only one color anyway!  So we can remove it:

``` r
ggplot(data = my_table) + 
  geom_bar(aes(x = eversmk, y = prop, fill = disease), stat = "identity", position = "dodge") +
  labs(fill = "MSCD status") +
  theme(legend.position = "none")
```

![](Module1_Class4_files/figure-html/legendremove-1.png)<!-- -->

### Removing missing values

You may have noticed that there are missing values of the BMI variable in this dataset.  We can see there are 124 missing values below: 

``` r
nmes_data %>%
  count(is.na(bmi))
```

```
## # A tibble: 2 × 2
##   `is.na(bmi)`     n
##   <lgl>        <int>
## 1 FALSE         3954
## 2 TRUE           124
```

If you were planning to use the BMI variable in your analysis, you would need to do something to account for these missing values.  The topic of missing data could be an entire course of its own; there are many ways to handle the missing values and usually just removing the observations where there are missing values is not appropriate because it can introduce bias into our results.

However much of the topic is beyond the scope of this course.  In this case, only about 3% of the observations have missing BMI data (`124/(124+3954)) = 0.0304`), so we may choose to just exclude those participants.  

If you wanted to remove all participants with missing values of `bmi`, you could use the `drop_na()` function to do this:

``` r
nmes_data_sub <- nmes_data %>%
  drop_na(bmi)

dim(nmes_data)
```

```
## [1] 4078   17
```

``` r
dim(nmes_data_sub)
```

```
## [1] 3954   17
```

``` r
nmes_data_sub %>% count(is.na(bmi))
```

```
## # A tibble: 1 × 2
##   `is.na(bmi)`     n
##   <lgl>        <int>
## 1 FALSE         3954
```

I wouldn't suggest doing this unless you are planning to use BMI in your analysis, because if you do you will be excluding some data that could be used to answer your question of interest!


## Starting Assignment 1.3

Do the following to address Question 1.1: How does the risk of disease compare for smokers and otherwise similar non-smokers?

1. (**Can work on this now!**) Improve your data display, if needed. Interpret your data display to answer the question. That is, what does this display say about Question 1.1? *Be sure to focus on answering the question being asked!*

2. (**Can work on this now!**) Update your multivariable logistic regression model, if needed.  Interpret your coefficients and associated significance tests to answer the question.  That is, what does this model say about Question 1.1?  *Be sure to focus on answering the question being asked!*

3. (**Wait for Wednesday!**) Complete a propensity score analysis to answer the question:

    * Estimate propensity scores for the treatment of smoking (`eversmk`); that is, use logistic regression to estimate the probability of smoking given possible confounders.
    * Use logistic regression with quintiles of your propensity scores to answer Question 1.1.
    * Interpret the results -- both the relevant coefficient(s) and associated significance tests. *Be sure to focus on answering the question being asked!*
    
    
4. (**Wait for Wednesday!**) Compare the results of your multivariable logistic regression with your propensity score analysis.  Are them similar? Different?  Which analysis method do you prefer and why?

5. Submission notes:
    * Submit your assignment in R Markdown through Github by Sunday (February 9, 2025) at midnight. You can find a link to create this assignment in GitHub on Canvas.
    * Post a **screenshot of your multivariable logistic regression results and your propensity score results**, on Piazza in the  "Assignment 1-3 Results" thread.  **Include your interpretations of what these two models say about Question 1.1 and any thoughts you have on which of these two analysis methods is preferred for answering Question 1.1.** 
    * On Piazza, you are welcome to post anonymously to your classmates. You can also include comments about what your chose to do or questions you had as you were making the display and fitting your model.
    * You may work together on this assignment, but you must submit your own assignment; please credit in your assignment anyone with whom you collaborated.
    * Next week in class we will start with discussion of your work.


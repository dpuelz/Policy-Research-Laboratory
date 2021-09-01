This exercise is based on the following paper:

Green, Donald P., Tiffancy C. Davenport, and Kolby Hanson (2019). “[Are
There Long-Term Effects of the Vietnam Draft on Political Attitudes or
Behavior? Apparently Not.](https://doi.org/10.1017/XPS.2018.18)”
*Journal of Experimental Political Science.* 6(2), 71-80.

This paper examines the long-term effects of the Vietnam draft lottery
on the political attitudes and behavior of the men who were were
eligible for the draft during the period of 1969–1971. Based on birth
dates, the draft lottery was used to randomly select men who turned 19
prior to 1969, 1970 and 1971 to serve in the US army. While many of
those selected did not eventually serve, the authors use a survey and
publicly available information, such as voter registration, voter
records and partisan membership of eligible draftees to study whether
being *assigned* to the draft has any long-term political effects.

The data set `survey.csv` contains the following variables.

| Name       | Description                                                                                                            |
|:-----------|:-----------------------------------------------------------------------------------------------------------------------|
| `draft`    | Whether a respondent was drafted (`1`) or not (`0`)                                                                    |
| `year`     | Birth year                                                                                                             |
| `ideology` | Ideology score that takes values from 1 to 5 where 1 is “very conservative,” 3 is “moderate,” and 5 is “very liberal.” |
| `state`    | Respondent’s living state                                                                                              |

## Question 1

Load the data and check the data with the `summary()` function. Which
variable (column) has a missing data? Also, check the number of
observations (including the missing values).

## Question 2

Calculate the mean ideology score by year that respondents were born in.
Briefly interpret the result (a sentence will suffice).

## Question 3

Events at an early stage of life can have a long-lasting impact on a
person’s political perspectives. In social sciences, we often measure
people’s views as ideology, typically using a one-dimensional left-right
scale. Estimate the sample average treatment effect on ideology. In this
question, we pool all years. Briefly interpret the result in a sentence.

## Question 4

Even if we assign the same treatment, respondent’s characteristics can
change its effect. In this question, we focus on the geographical
heterogeneity. Estimate the sample average treatment effect on ideology
**by state** (you can still pool all years). Avoid the repetition of the
code by defining a function. Finally, briefly interpret the result (a
sentence will suffice).

## Question 5

A politician from a country in Asia is planning to use this paper to
discuss the effect of Draft lottery in her country. Is this a valid
approach for policy making? Discuss briefly (two to four sentences will
suffice).

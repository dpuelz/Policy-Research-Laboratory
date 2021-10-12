# FIN 373: Policy Research Laboratory

Welcome to the Fall 2021 edition of Policy Research Laboratory, a course on causal inference and data-driven policy research.  All course materials can be found on this GitHub page.  Please see the [course syllabus](syllabus.pdf) for links and descriptions of the readings mentioned below.

Instructors:  
- Prof. David Puelz.  Office hours Wednesday and Thursday, from 1:30p-2:30p in CBA 6.444.

Teaching Assistants:
- Matthew Vu
- Jacob Roth

TAs will host a coding session on Friday afternoon.  Attendance is required.

## Class meetings

- Tuesday and Thursday, from 11a-12:30p in CBA 4.342.
- Friday, from 3-4p in CBA 4.338.

## Exercises

There will be individual, weekly exercises to be turned in each Tuesday before each class via canvas.  They will be posted here each Monday of the prior week.  

- [Week 1 exercises](assignments/HW1.pdf). Due 8/31. Data: [cars.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/cars.csv).
- [Week 2 exercises](assignments/HW2.pdf). Due 9/7. Data: [turnout.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/turnout.csv) and [STAR.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/STAR.csv).
- [Week 3 exercises](assignments/HW3.pdf). Due 9/14. Data: [gay.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/gay.csv) and [leaders.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/leaders.csv).
- [Week 4 exercises](assignments/HW4.pdf). Due 9/21. Data: [rosca.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/rosca.csv) and [predimed.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/predimed.csv).
- [Week 5 exercises](assignments/HW5.pdf). Due 9/28. Data: [fraud.RData](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/fraud.RData). 
- [Week 6 exercises](assignments/HW6.pdf). Due 10/5. Data: [justices.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/justices.csv) and [yu2017sample.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/yu2017sample.csv).
- [Week 7 exercises](assignments/HW7.pdf). Due 10/12. Data: [finlit15and18.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/finlit15and18.csv) and [transfer.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/transfer.csv).

## Midterm and Project

Details about the midterm on 10/21 and the final project can be found [here](slides/PRL-project_midterm.pdf).

## Software

Please install [R](http://www.r-project.org) and then [RStudio](http://www.rstudio.org) on your own computer (you want the "RStudio Desktop" version).  Both are free and work on all platforms.  R is the underlying data-analysis program we'll use in this course, while RStudio provides a nice front-end interface to R that makes certain repetitive steps (e.g. loading data, saving plots) very simple.

## Outline of topics  

### (1) Introduction

Slides: [Intro](slides/PRL-intro.pdf)

Code for class:
- [Basic R functionality](code/intro1.R)

Readings:  
- [Introduction to RMarkdown](http://rmarkdown.rstudio.com)  
- [RMarkdown tutorial](https://rmarkdown.rstudio.com/lesson-1.html)  

### (2) Causality

Slides: [Causality](slides/PRL-causality.pdf)

Exercises (in-class):
- [Draft lottery](code/draftlottery.md) and [survey.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/survey.csv) - 9/2 and 9/7
- [Minimum wage - uncommented code](code/causality_minwage.R) and [minwage.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/minwage.csv) - 9/14

Code for class:
- [Simple causal analysis](code/causality1.R)
- [Randomized policing intervention](code/causality_police.R)

### (3) Probability

Slides: [Probability](slides/PRL-probability.pdf)

Code for class:
- [Simulating random variables](code/probability.R)

Readings:  
- An excerpt from Chapter 7 of [AIQ: How People and Machines are Smarter Together](readings/AIQ_excerpt_contraceptive_effectiveness.pdf), by Nick Polson and James Scott.  
- [Rich State, Poor State, Red State, Blue State](http://www.stat.columbia.edu/~gelman/research/published/rb_qjps.pdf) and a shorter prelude to this article, [Gelman's blog](https://statmodeling.stat.columbia.edu/2005/11/07/income_matters/).

### (4) Prediction

Slides: [Prediction](slides/PRL-prediction.pdf)

Code for class:
- [Fitting linear models with R](code/linearmodels.R)
- [Bootstrapping](code/bootstrap.R)
- [Regression discontinuity](code/RD.R)


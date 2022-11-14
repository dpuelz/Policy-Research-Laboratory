# FIN 373: Policy Research Laboratory

Welcome to the Fall 2022 edition of Policy Research Laboratory, a course on causal inference and data-driven policy research.  All course materials can be found on this GitHub page.  Please see the [course syllabus](syllabus.pdf) for links and descriptions of the readings mentioned below.

Instructors:  
- Prof. David Puelz.  Office hours Tuesday and Thursday, from 2:00p-3:00p in CBA 6.444.

Teaching Assistants:
- Ashna Bhansali
- Myeongrok Doh, "Doh"

TAs will host a coding session on Friday morning.  *Attendance is required*.

## Class meetings

- Tuesday and Thursday, from 12:30p-2:00p in CBA 6.420.
- Friday, from 10:00a-11:30a in GSB 5.154.

## Exercises

There will be individual, weekly exercises to be turned in each Tuesday before each class via canvas.  They will be posted here each Monday of the prior week.  

- [Week 1 exercises](assignments/HW1.pdf). Due 8/30. Data: [cars.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/cars.csv).
- [Week 2 exercises](assignments/HW2.pdf). Due 9/6. Data: [turnout.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/turnout.csv) and [STAR.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/STAR.csv).
- [Week 3 exercises](assignments/HW3.pdf). Due 9/13. Data: [gay.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/gay.csv) and [leaders.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/leaders.csv).
- [Week 4 exercises](assignments/HW4.pdf). Due 9/20. Data: [rosca.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/rosca.csv) and [predimed.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/predimed.csv).
- [Week 5 exercises](assignments/HW5.pdf). Due 9/27. Data: [fraud.RData](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/fraud.RData). 
- [Week 6 exercises](assignments/HW6.pdf). Due 10/4. Data: [justices.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/justices.csv) and [yu2017sample.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/yu2017sample.csv).
- [Week 7 exercises](assignments/HW7.pdf). Due 10/11. Data: [finlit15and18.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/finlit15and18.csv) and [transfer.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/transfer.csv).
- [Week 8 exercises](assignments/HW8.pdf). Due 10/18. Data: [electric-company.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/electric-company.csv).
- Week 9 exercises. None - midterm!
- [Week 10 exercises](assignments/HW9.pdf). Due 11/1. Data: [social_marketing.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/social_marketing.csv).
- [Week 11 exercises](assignments/HW10.pdf). Due 11/8.  This homework asks for initial project summaries.
- [Week 12 exercises](assignments/HW11.pdf). Due 11/15. Data: [newspapers.RData](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/newspapers.RData). 


## Midterm and Project

Details about the midterm on 10/20 and the final project can be found [here](slides/PRL-project_midterm.pdf).

A couple places to look for data:
- [Harvard Dataverse](https://dataverse.harvard.edu).  Compilation of data (and code) from research projects ranging from medicine and law to business and public policy.  Often accompanied by a peer-reviewed paper.
- [FRED](https://fred.stlouisfed.org).  Tons of economic data from the St. Louis Fed.
- [Johns Hopkins COVID data](https://github.com/CSSEGISandData/COVID-19).  A lot of data related to the pandemic sits here.
- [Amazon Web Services Data Exchange](https://aws.amazon.com/marketplace/search/results?category=d5a43d97-558f-4be7-8543-cce265fe6d9d&FULFILLMENT_OPTION_TYPE=DATA_EXCHANGE&filters=FULFILLMENT_OPTION_TYPE).  Many sources ... be sure to look into the subscription and data access requirements.
- [McCombs Business Research Center](https://guides.lib.utexas.edu/BRC).
- [Tyler Moore's website: Cybersecurity and Crypto-related research](https://tylermoore.ens.utulsa.edu/pub.html).

Project presentation schedule is:

- Tuesday, November 29: Loren / Ranak + Charles + Mehar / Ruijia + Jessica
- Thursday, December 1: Michelle + Grace + Anusha / Jeremy + Sarah + Sahas

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
- [Draft lottery](code/draftlottery.md) and [survey.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/survey.csv)
- [Minimum wage - uncommented code](code/causality_minwage.R) and [minwage.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/minwage.csv)

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
- [Regression DiD](code/DiD.R)
- [Regression discontinuity](code/RD.R)

### (5) Unsupervised learning

Slides: [Unsupervised learning](slides/PRL-unsupervised.pdf)

Code for class:
- [K-means++](code/cars.R) and [cars.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/Policy-Research-Laboratory/blob/main/data/cars.csv)
- Hierarchical clustering [example 1](code/linkage_minmax.R) and [example 2](code/hclust_examples.R)
- [PCA introduction](code/pca_intro.R)
- PCA examples: [NBC shows](code/nbc.R), [Congress](code/congress109.R), [ERCOT](code/ercot_PCA.R)

### (6) Networks + Text 

Slides: [Networks](slides/PRL-networks.pdf) & [Text](slides/PRL-text.pdf)

Code for class:
- [Medici family](code/medici.R)
- [Playlists](code/playlists.R)
- A useful network visualization software: [Gephi](https://gephi.org)
- [Text example](code/tm_examples.R) with [data](https://github.com/dpuelz/Policy-Research-Laboratory/tree/main/data/ReutersC50/C50test/SimonCowell).
- [Price elasticity of beer](code/smallbeer.R)

### (7) Advanced topics in causal inference

Slides: [Bias-variance tradeoff](slides/PRL-biasvariancetradeoff.pdf) & [ML for causal inference](slides/PRL-selectionandRIC.pdf).

Code for class:
- [BART example](code/makeBARTsim.R)
- [Freakonomics example, crime and abortion](code/levitt.R)

Readings:
- [Gender Gaps in Performance: Evidence from Young Lawyers](readings/gendergap_lawyers.pdf) and [Statistical Analysis of Gender Patterns in Walmart Workforce](readings/walmart.pdf) + [Appendix](readings/walmart_appendix.pdf)
- [Introduction to Statistical Learning, 2nd Edition](https://web.stanford.edu/~hastie/ISLR2/ISLRv2_website.pdf)

### (8) Data visualization

Slides: [Introduction to data visualization](slides/PRL-datavizslides.pdf)
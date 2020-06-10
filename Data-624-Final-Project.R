library(readxl)
train <- read_excel("StudentData.xlsx")




library(caret)
library(pls)
library(tidyverse)
library(AppliedPredictiveModeling)
library(corrplot)
library(kableExtra)
library(mlbench)
library(dplyr)


train <- train %>% drop_na(PH)



library(earth)
MARS_grid <- expand.grid(.degree = 1:2, .nprune = 2:15)
MARS_model <- train(PH ~., 
                    data = train,
                    method = "earth",
                    tuneGrid = MARS_grid,
                    preProcess = c("center", "scale"),
                    tuneLength = 10,
                    na.action=na.exclude)
MARS_model
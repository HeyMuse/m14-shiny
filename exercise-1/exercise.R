# Exercise 1: Loading functions

# Set your directory
setwd('C:/Users/HeyMus/Documents/info-R201/m14-shiny/exercise-1')

# Load your buildMap.R Script
source('./scripts/buildMap.R')
df <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/2014_us_cities.csv')


# Use your BuildMap function to draw a map of the data

install.packages("shiny")

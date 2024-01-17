#Data exploration cont.
df_dataset2<-df_dataset

df_dataset2$revenue #column selection

df_dataset2['revenue'] #column selection

df_dataset2$widgetName <-NULL #removing a column

data_cleaned<-na.omit(df_dataset2, cols='revenue') # per column 

colSums(is.na(data_cleaned))

names(df_dataset2)  # equivalent to the column attribute in python 

#Plotting

#hist(df_dataset2$revenue, main='Revenue frenquency', xlab='')
hist(df_dataset2$revenue)

function_dist<-function(){
  hist(df_dataset2$revenue, main='Revenue frenquency', xlab='')
}

function_dist()


install.packages("ggplot2")
                
library(ggplot2)

library(dplyr)

df_titanic<- as.data.frame(Titanic)

?Titanic

#mtcars dataset analysis and plotting
?mtcars

mtcars

#exploratory commands
summary(mtcars)
str(mtcars)

typeof(mtcars)

#convert the dataset as list to a dataframe
df_cars<- as.data.frame(mtcars)

typeof(df_cars)
class(df_cars)
class(mtcars)
#basic plot to look at the correlation between car's horsepower and weight

names(df_cars)

plot(df_cars$hp, df_cars$wt, main='car weight against horsepower')


?ggplot2
#install.packages("ggplot2")
library(ggplot2)


#box plot
plot1<-ggplot(df_cars, aes(x=df_cars$hp, y=df_cars$wt))+
  geom_boxplot()

#alternative writing
a<-ggplot(df_cars, aes(x=df_cars$hp, y=df_cars$wt))
a+geom_boxplot()

#histogram
ggplot(df_cars, aes(x=df_cars$mpg))+
  geom_histogram()

mean(df_cars$mpg)
#bar plot
ggplot(df_cars, aes(x=as.factor(hp)))+
  geom_bar()

#scatter plot
f1<- ggplot(df_cars, aes(x=df_cars$hp, y=df_cars$wt, color='red'))+
f2 <- geom_point()
f3<- labs( title='Car weight against hoursepower',
           x='car weight',
           y='hoursepower'
           )
f1+f2+f3...fn

ggplot(df_cars, aes(x=df_cars$hp, y=df_cars$wt, color='red'))+
  geom_point()+
  labs(
    title='Car weight against hoursepower',
    x='car weight',
    y='hoursepower'
  )+
  geom_smooth(method='lm', color='purple')

#it seems we have a moderate positive correlation between
#the horsepower and car weight.

?mtcars

#Activity: explore other variables using the same plot as above 
#to look for potential correlations  

ggplot(df_cars, aes(x=df_cars$mpg, y=df_cars$hp, color='red'))+
  geom_point()+
  labs(
    title='miles per gallon against hoursepower',
    x='miles/(US) gallon',
    y='gross horsepower'
  )+
  geom_smooth(method='lm', color='blue')


figure1<-ggplot(df_cars, aes(x=df_cars$hp, y=df_cars$wt))
figure1+geom_point()


ggplot(df_cars, aes(x=df_cars$mpg, y=df_cars$wt, color=factor(cyl)))+
  geom_point()+
  labs(
    title='Car weight against hoursepower',
    x='fuel efficiently',
    y='car weight'
  )+
  geom_smooth(method='lm', color='purple')
  #theme_linedraw()

names(df_cars)

library(help = "datasets")

#library(sm)

#ggplot(df_cars, aes(x=df_cars$hp, y=df_cars$wt, color='red'))+
  #geom_point()+
  #sm_statCorr(corr_method='spearman')

install.packages("tidyverse")  
library("tidyverse") #grouping

?install.packages("tidyverse") 
?tidyverse

df_indutry<- df_dataset2 %>%
  group_by(industry) %>%
  summarise(summary = mean(revenue))%>%
  arrange(desc(summary))
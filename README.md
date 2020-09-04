# Data-Minning-Project

Background:
Kickstarter is an American public benefit corporation based in Brooklyn, New York, that maintains a global crowdfunding platform focused on creativity.The company's stated mission is to "help bring creative projects to life".<br/>
As of December 2019, Kickstarter has received more than $4.6 billion in pledges from 17.2 million backers to fund 445,000 projects, such as films, music, stage shows, comics, journalism, video games, technology, publishing, and food-related projects. <br/>

People who back Kickstarter projects are offered tangible rewards or experiences in exchange for their pledges. <br/>
This model traces its roots to subscription model of arts patronage, where artists would go directly to their audiences to fund their work. <br/>

For every sucessful campaign Kickstarter gets a 5% commission.

# Business Use Case:<br/>

This project collated and analyzed Kickstarter Campaign data  to construct a model that would predict the success or failure of a campaign at launch time.<br/>

Existing problem: The Kickstarter campaign failiure rate is high that would potentially lead to loss of commission associated with each campaign.<br/>
Being a data scientist we would like to help Kickstarter by building a model that would correctly predict the sucessful campaigns and Kickstarter would ask investors to invest on these campaigns.

![alt text](https://github.com/sdmishra123/Data-Minning-Project/blob/master/PS.JPG)<br/>

# Data Specifications:<br/>

Data was procured from this Website: <br/>
#### >  https://webrobots.io/kickstarter-datasets/<br/>

Date Range :<br/>
2009 - 2020

File Size : 52 GB <br/>
Data Size :<br/>
Rows : 464,241<br/>
Columns : 22<br/>

# Model Development Steps:

# Exploratory Data Analysis:<br/>

![alt text](https://github.com/sdmishra123/Data-Minning-Project/blob/master/EDA%201.JPG)<br/>
![alt text](https://github.com/sdmishra123/Data-Minning-Project/blob/master/EDA%202.JPG)<br/>

# Feature Engineering:<br/>
![alt text](https://github.com/sdmishra123/Data-Minning-Project/blob/master/FE.JPG)<br/>

# Proposed Models:
Given that we dealing with a classification problem where we have to predict if a campaign would be sucessful or no, we propose the below models:
> 1.Logistic Regression
> 2.Random Forest 
> 3.Boosting Models  
> 4.Stack/ensemble models

# Model Perfomance Measure:
> Precision
> Recall
> F1 score 
> AUC  

![alt text](https://github.com/sdmishra123/Data-Minning-Project/blob/master/Model Perf.JPG)<br/>

![alt text](https://github.com/sdmishra123/Data-Minning-Project/blob/master/Best Predictors.JPG)<br/>



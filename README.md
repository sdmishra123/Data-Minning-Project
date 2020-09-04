# Data-Minning-Project

Background:
Kickstarter is an American public benefit corporation based in Brooklyn, New York, that maintains a global crowdfunding platform focused on creativity.The company's stated mission is to "help bring creative projects to life".<br/>
As of December 2019, Kickstarter has received more than $4.6 billion in pledges from 17.2 million backers to fund 445,000 projects, for the 9 major categories such as films, music, stage shows, comics, journalism, video games, technology, publishing, and food-related projects. <br/>

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
### Below are the some key data insights.

Crowdfunding has been very popular within US, so we narrowed down our analysis to US region
![alt text](https://github.com/sdmishra123/Data-Minning-Project/blob/master/EDA%201.JPG)<br/>

We wanted to see how our Response looks like for the various campaign categories. We observed slight data imbalance under the various Campaign Categories. But there are no major concerns as we can fit the model for the given data distribution.
![alt text](https://github.com/sdmishra123/Data-Minning-Project/blob/master/EDA%202.JPG)<br/>

# Feature Engineering:<br/>
![alt text](https://github.com/sdmishra123/Data-Minning-Project/blob/master/FE.JPG)<br/>

# Proposed Models:<br/>
Given that we dealing with a classification problem where we have to predict if a campaign would be sucessful or no, we propose the below models:<br/>
> 1.Logistic Regression<br/>
> 2.Random Forest <br/>
> 3.Boosting Models  <br/>
> 4.Stack/ensemble models<br/>

# Model Perfomance Measure:<br/>
> Precision<br/>
> Recall<br/>
> F1 score <br/>
> AUC  <br/>

The below image shows the model performance for the top 5 models that were fitted. Among all the models Adaptive Boosting performed the best for 80%-20% train-test data spilt. With 94.6% AUC and the Recall rate was noted as 93%.<br/>

![alt text](https://github.com/sdmishra123/Data-Minning-Project/blob/master/Model%20Perf.JPG)<br/>

We were interested to see which are the most important predictor variables for our model showing the positive and negative correlation with the response.<br/>
![alt text](https://github.com/sdmishra123/Data-Minning-Project/blob/master/Best%20Predictors.JPG)<br/>

# Conclusion: <br/>
### Some of the key conclusion<br/>
1.Campaigns owner should set a realistic goal for their campaigns to be sucessful.<br/>
2.The campaign duration should be live for a limited time not very long or short<br/>
3.The campaign name length and description matters alot. Campaign owners should propose some catch campaign names.<br/>
4.Campaigns from categories like music, games and Film & Videos show high sucess rate.<br/>

# Recommendations:<br/>
1. Potential Predictors:<br/>
> Creator identity-Individual/Team/Organization<br/>
> Kickstarter verified<br/>
> Profit/Non-profit cause<br/>
> Click/View <br/>

2. Better classification of sub-categories <br/>
3. Help campaign creators to launch successful project<br/>


# Future Work:<br/>
Web scrapping<br/>
Use json files instead of csv<br/>
Sentiment analysis/ Text mining on features like 'blurb' and  'name' <br/>                      
Better business models post discussions with Kickstarter Team<br/>
Prediction using Random effect Bayesian models<br/>
Generate new features from 'Comments'<br/>


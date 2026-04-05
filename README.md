# Ad_click_analysis

**Project Overview:**

This project focuses on analyzing user interaction with online advertisements to understand click behavior and identify factors influencing engagement. The primary goal is to evaluate ad performance using key metrics like Click-Through Rate (CTR), uncover high-performing and underperforming segments, and identify hidden growth opportunities.

The analysis was carried out using exploratory data analysis (EDA), SQL queries, and interactive dashboards to derive meaningful insights related to user demographics, product performance, time-based engagement, and webpage effectiveness.

**Dataset Description:**

The dataset contains user-level ad interaction data where each row represents an advertisement impression shown to a user.

It includes information about whether the user clicked on the ad, along with attributes related to user demographics, product, campaign, and time.

**Key Columns Include:**

is_click → Indicates whether the ad was clicked (1 = Yes, 0 = No)
product → Product category displayed in the ad
campaign_id → Campaign identifier
webpage_id → Webpage where the ad was shown
gender → User gender
age_level → Categorized age group
hour → Hour of ad impression
day_of_week → Day of interaction

**Key Metric:**

Click-Through Rate (CTR)
Defined as:
CTR = Total Clicks / Total Impressions
Used as the primary performance indicator across all segments

**Tools Used:**

MySQL – For writing SQL queries and performing data analysis
Python (Jupyter Notebook) – For data cleaning, preprocessing, and exploratory analysis
Power BI – For building interactive dashboards and visualizing key insights

**Key Insights:**

1. Overall CTR(Click through rate) is low (6.76%) that is out of 100% of Ad interactions only 6.76% clicked it.

![overall_ctr](images/overall_ctr.png)

**-> Business Recommendation: Improve Overall Engagement**
- Improve Ad creatives with better visuals & attractive headlines
- Use more personalised ads

2.  Certain age levels such as 0,6,1,5 are likely to click the ads more in comparison to other age levels with higher CTR.

![ctr_by_Age](images/ctr_by_age.png)

**-> Business Recommendation: Target High-Performing Age Groups**
- Customise ads based on their preferences
- Allocate more budget to these segments

3.  Morning & Midnight are our peak hours where users likely click the ads with high CTR.

![peak_hours](images/peak_bottom_hours.png)

**-> Business Recommendation: Optimise Ad timing**
- Show more ads during these hours
- Adjust spending during low-performing hours
  
4.  Lower age level people likely click our ads at night with high CTR i.e 28.57% & also it can be observed that these users are our primary segment with consistent higher CTR across the hours.

![CTR_byhour_Age](images/CTR_by_hour_age.png)

**-> Business Recommendation: Focus on Young users at night**
- Use content relevant to their behavior (entertainment, quick offers)
- Peronalise their preferences & Run targeted night campaigns for younger users
  
5. There could be found few hidden opportunity where CTR was comparatively high but user exposure was relatively low such as Product J had high CTR(9.27%) but relatively low user exposure(around 9k) indicating strong potential for scaling ad reach. 

![high_ctr_low_exposure](images/highctr_lowexposure.png) 

**-> Business Recommendation: Scale high-performing products**
- Increase visibilty of the particular product( For eg: Product J)
- Feature it in top campaigns/webpages


Perfect — here’s your final, clean, professional ML section for your README 👇
(You can copy-paste this directly)

**Machine Learning Model**

**Objective:**
The goal of the machine learning model is to predict whether a user will click on an advertisement (is_click = 1) or not (is_click = 0).
This helps in identifying potential customers and optimizing ad targeting strategies.

**Challenge Faced:**
The dataset was highly imbalanced:

~93% users did not click (0)
~7% users clicked (1)

This caused  models like logistic regression, random forest classifier to achieve high accuracy but fail in detecting actual clicks.

**Approach & Solution:**

To handle the imbalance and improve model performance:

1. Used Random Forest Classifier
A robust ensemble learning method that captures complex patterns in the data.

2. Applied Class Weight Balancing
RandomForestClassifier(class_weight='balanced')

This ensures the model gives more importance to the minority class (clicks).

3. Used Probability-Based Prediction
Instead of using default predictions, probabilities were used:

y_prob = model.predict_proba(X_test)[:,1]

4. Threshold Tuning (Key Step)
The default threshold (0.5) was adjusted to 0.3:

y_pred = (y_prob > 0.3).astype(int)
This significantly improved the model’s ability to detect actual clicks.

Model Evaluation

Instead of relying only on accuracy, the model was evaluated using:

Precision
Recall
F1-score
Confusion Matrix

**Key Insight:**

- The initial model had high accuracy (~93%) but failed to detect clicks.
- After applying class balancing and threshold tuning, the model successfully identified a large portion of actual clickers.
- This trade-off prioritizes recall over precision, which is suitable for marketing use cases.

**Business Impact:**

- Helps identify users more likely to click ads
- Reduces missed opportunities (false negatives)
- Improves ad targeting and campaign efficiency
- 

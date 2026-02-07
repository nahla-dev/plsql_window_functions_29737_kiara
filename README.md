# plsql_window_functions_29737_kiara
SQL Joins and Window Functions Assignment

Business Context: Netflix

step1: Business overview

Netflix is a worldwide streaming service offering movies, TV shows, and original content. The Content & Marketing team studies user behavior and content popularity to decide which shows to promote, which genres to produce, and which customers may need discounts to stay subscribed.

Step 2: Problem Definition 

Netflix wants to understand how users behave on its platform and which content is most popular. The company needs to identify users who watch a lot of content and pay for premium plans, as well as users who may stop their subscriptions. Netflix also wants to see how different types of content perform in different regions. Without this information, Netflix may invest in content that does not match what viewers in each region actually like.

Expected Outcome

The results will help Netflix decide which content should be continued or renewed in each region. The analysis will also help identify groups of customers who should receive special offers or discounts to encourage them to keep their subscriptions.



1.Top 3 Most-Watched Shows per Country $\rightarrow$ RANK()
2.Running Total of Global Subscribers by month $\rightarrow$ SUM() OVER()
3.Growth in Monthly Subscription Revenue (Current month vs. Previous) $\rightarrow$ LAG()
4.User Engagement Quartiles (Segmenting users by total hours watched) $\rightarrow$ NTILE(4)
5.30-Day Moving Average of New Sign-ups to identify long-term growth trends $\rightarrow$ AVG() OVER()

step4:.Database Schema
The database consists of three tables:
- Users
- Content
- Views

Step 5: Database Schema Design (The "Netflix" Model)
This is the table i have to create to meet my requirements

1. Users Table
-user_id (PK)
-user_name
-country
-subscription_plan 

2. Content Table
-content_id (PK)
-title
-genre
-release_year

3. Views Table 
-view_id (PK)
-user_id (FK)
-content_id (FK)
-view_date
-minutes_watched

step6: SQL JOINs 
This project demonstrates:
- INNER JOIN: to analyze valid user-content views
- LEFT JOIN: to identify users with no viewing activity
- FULL OUTER: JOIN to detect unmatched users or content
- SELF JOIN: to compare users within the same country
- RIGHT JOIN : to identify content that has never been viewed

step7:Result analysis
1. descriptive

 Comedy and Sci-Fi are the most popular genres with the highest total views and minutes watched. Thriller and Drama are less watched, but Thriller has longer average session length.
**Supporting Table:**

<img width="877" height="609" alt="Screenshot 2026-02-07 060243" src="https://github.com/user-attachments/assets/e48ba7b9-54cb-4031-b7fa-30505abcee10" />


 2.diagnostic
     The analysis shows that Basic users are leaving because they do not get high-definition content, so they switch to other streaming services

3. Prescription:
   
 We recommend giving Basic users 48 hours of 4K access after they watch 10 hours of content. This encourages them to watch more and shows them the benefits of upgrading to a higher plan.










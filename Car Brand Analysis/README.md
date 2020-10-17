# Car Brand Analysis
Assuming the role of an analytics consultant to a (i) brand manager, (ii) product manager and (iii) advertising manager. My job is to give advice/insights to these individuals based on the analysis of social media conversations. The detailed tasks are described below.

1. Write a **scraper using Selenium** to fetch messages posted in **Edmunds.com** discussion forums. The scraper output should be a .csv file with the following columns: date, userid, and message (even though you will only use the messages in your analysis). Before you develop the scraper, carefully study one of the forums on Edmunds.com to understand the html as well as the threading structures

2. Fetch around 4,000-5000 posts about cars from a General topics forum. The idea is to have multiple brands and models being discussed without one of them being the focal point. You can choose early or recent posts (do mention what you have chosen). Note that Edmunds changed its forum structure a few years ago, but left the early posts with the old structure. So you should choose either the 4-5k oldest or newest posts

3. Once you fetch the data, find the **top 10 brands** from frequency counts. You will need to write a script to count the frequencies of words (stopwords should not be counted). Replace frequently occurring car models with brands so that from now on you have to deal with only brands and not models. You will need another script for this job. A list of model and brand names (not exhaustive) are provided in a separate file.

Task A: Identify top 10 brands by frequency. From the posts, **calculate lift ratios** for associations **between the brands**. You will have to write a script to do this task). For lift calculations, be sure not to count a mention more than once per post, even if it is mentioned multiple times in the post.
Show the brands on a **multi-dimensional scaling (MDS) map**.

Task B: What insights can you offer brand managers from your analysis in Task A?

Task C: What are 5 most frequently mentioned **attributes** of cars in the discussions? Which attributes are most strongly **associated with which of these 5 brands**?

Task D: What advice will you give to a (i) product manager, and (ii) marketing/advertising manager of these brands based on your analysis in Task C? (Assuming positive sentiment)

Task E: Which is the most **aspirational brand** in your data in terms of people actually wanting to buy or own? Describe your analysis. What are the business implications for this brand?

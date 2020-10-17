# Beer-Recommendation-System
Crowdsourced recommendation system using sentiment analysis, and comparing results using plain vanilla bag-of-words and word vectors
- scrape 6k reviews of the top 250 rated beers on beeradvocate.com
- similarity analysis using cosine similarity with 3 attributes of a beer (users inputs). Calculate the average similarity between each of the attributes and each beer on beeradvocate.com.
- for every review, performed a feature-level sentiment analysis for each of the three features, then calculate the average sentiment for each attribute and for the three features
- calculate an evaluation score for each beer = average similarity score + average feature sentiment score
- recommend 3 beers to the user using the plain-vanilla bag-of-words cosine similarity and compare to a recommendation using word vectors (spaCy)

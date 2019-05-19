# BigFiveResults
After taking the [Big Five Personality Test](http://www.personalitytest.net/ipip/ipipneo120.html), I have saved the results in a `.txt` file that can be found [here](https://github.com/RSijelmass/BigFiveResults/blob/master/spec/fixtures/big_five_profile.txt).
This projects converts these raw results in a JSON format that can post the
results to an external API.

## Cloning the project
```
git clone git@github.com:RSijelmass/BigFiveResults.git
cd BigFiveResults
```

## Final Result
```
{
  "EXTRAVERSION": {
   "Overall Score": "85",
   "Facets": {
     "Friendliness": "96",
     "Gregariousness": "75",
     "Assertiveness": "47",
     "Activity Level": "73",
     "Excitement-Seeking": "51",
     "Cheerfulness": "94"
    }
  },
 "AGREEABLENESS": {
   "Overall Score": "92",
   "Facets": {
     "Trust": "95",
     "Morality": "58",
     "Altruism": "79",
     "Cooperation": "89",
     "Modesty": "40",
     "Sympathy": "95"
    }
  },
 "CONSCIENTIOUSNESS": {
   "Overall Score": "48",
   "Facets": {
     "Self-Efficacy": "34",
     "Orderliness": "44",
     "Dutifulness": "31",
     "Achievement-Striving": "71",
     "Self-Discipline": "75",
     "Cautiousness": "33"
    }
  },
 "NEUROTICISM": {
   "Overall Score": "10",
   "Facets": {
     "Anxiety": "14",
     "Anger": "7",
     "Depression": "7",
     "Self-Consciousness": "21",
     "Immoderation": "62",
     "Vulnerability": "24"
    }
  },
 "OPENNESS TO EXPERIENCE": {
   "Overall Score": "96",
   "Facets": {
     "Imagination": "90",
     "Artistic Interests": "88",
     "Emotionality": "57",
     "Adventurousness": "98",
     "Intellect": "37",
     "Liberalism": "97"
    }
  },
 "NAME": "Rita Sijelmass",
 "EMAIL": "My Email"
}
```

## Limitations
- In `BigFiveResultsTextSerializer`, the transformation from topics' arrays to hashes assume that the first line
  in the text file contains the topic title and overall score. If the layout of the file changes, having the title for example at the bottom, this would no longer work. 
  An additional way of finding the topic title could be by searching for all
caps names, all though that is still a little smelly. The best way may be to hardcode a hash map
with all values of topic names you can search through
- `BigFiveResultsTextSerializer` also makes the assumption that all topics are
  separated by an empty line. This also isn't as scalable, and would be one of
the first things I would change if we'd have to productionise the code. 
- Another assumption made by the tests in `BigFiveResultsTextSerializer` is
  that the topics will not change. If any of their names change, the specs will
fail. Another thing I'd work on if we'd continue on this project is having
a more dynamic way to test the behaviour of the methods, not their outcomes.
- Even though there is the flexibility to add in an email address to post with
  the results hash, the name has been hardcoded in the
`BigFiveResultsTextSerializer`.

# BigFiveResults
After taking the [Big Five Personality Test](http://www.personalitytest.net/ipip/ipipneo120.html), I have saved the results in a `.txt` file that can be found [here](https://github.com/RSijelmass/BigFiveResults/blob/master/spec/fixtures/big_five_profile.txt).
This projects converts these raw results in a JSON format that can post the
results to an external API.

## Cloning the project
```
git clone git@github.com:RSijelmass/BigFiveResults.git
cd BigFiveResults
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

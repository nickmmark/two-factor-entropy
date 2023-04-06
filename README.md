# are 2FA tokens truly random?

## background
`Two factor authentication` (2FA) is a widely used tool for added security in addition to a secure password. A [Time based One-time Password](https://www.rfc-editor.org/rfc/rfc6238) (TOTP) algorithm generates a 6-8 digit code, which is shared either via SMS, email, phone, and a specialized app. Users have 30-60 seconds to receive, remember, and enter the code to login.

Either a random or pseudo-random number could be used. While a truly random number theoretically provides greater security, a pseudo-random (or non-random) number would be easier to remember. In principle, a pseudo-random number could provide a balance of security and be easier to remember.

An average person can hold a set of about 7 ± 2 digits in his/her working memory at any given time. This is called the `The Magical Number Seven, Plus or Minus Two Rule` or simply [Miller's Rule](https://en.wikipedia.org/wiki/The_Magical_Number_Seven,_Plus_or_Minus_Two). According to Miller's Rule a significant minority of people will struggle to recall a 6 digit code, and a majority will be unable to recall an 8 digit code.

Anecdotally, I have noticed that 2FA codes often exhibit patters of non-randomness (such as containing 3 more of the same digit XAAA-BBBX, repeating patterns ABAB-XXXX or ABXX-ABXX). The human brain is highly skilled at discerning patterns, even when none actually exist. Therefore I decided to analyze 2FA tokens using Shannon Entropy to see if they consistently exhibit less than expected randomness.


## approach

Shanon's entropy is a measure of the information content of a string. It can be interpreted as the number of bits required to encode each character of the string given perfect compression.

If a 2FA token is truly random, we would expect it to have higher Shanon Entropy than if is was generated pseudo-randomly (or was non-random). We can compare the Shanon Entropy of an array of actual 2FA codes with an array that we generate randomly, using the following approach:

![2FA_entropy](https://user-images.githubusercontent.com/48685552/230439251-1d4c4ff9-8e06-4cf2-a69f-c5576138ca71.png)

1. generate random 6 digit codes
2. calculate the shanon entropy of each
3. calcualte the mean entropy (and standard deviation) for the group of values
4. compare the two groups to determine if it is statistically likely be random


## results

### experiment 1 -
I used the 35 most recent 2FA codes from my work outlook account and compared against 10,000 randomnly generated 6 digit codes

| Category  | n |  mean entropy | SD entropy |
| ----- | ------ | ------ | ------ |
| 2FA  | 35  |2.072721 | 0.3163435 |
| Random  | 10000  | 2.124127	| 0.3102022 |

I compared these two groups using a Welch two sample t-test, and calculated `p-value = 0.4143`
Conclusion: this is not a significant difference


## references:
* Miller, George A. (1956). [The magical number seven, plus or minus two: Some limits on our capacity for processing information.](http://psychclassics.yorku.ca/Miller/) Psychological Review.
* Shannon, Claude E. (July/October 1948). [A Mathematical Theory of Communication, Bell System Technical Journal 27](https://www3.nd.edu/~powers/ame.20231/shannon1948a.pdf) (3): 379-423.
* Ihara, Shunsuke (1993) Information theory for continuous systems, World Scientific. p. 2. ISBN 978-981-02-0985-8.
* Internet Engineering Task Force (2011) [TOTP: Time-Based One-Time Password Algorithm](https://www.rfc-editor.org/rfc/rfc6238)

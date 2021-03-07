# two-factor-entropy

Two facto authentication is a widely used tool for added security in addition to an account password. Several types exist. The most common is an SMS message with a 4-8 digit number that must be entered promptly to permit access.

I have noticed that these numbers often exhibit signs of non-randomness (containing 3 more of the same digit XAAA-BBBX, repeating patterns ABAB-XXXX). The human brain is highly skilled at discerning patterns, even when none actually exist. Therefore I decided to analyze 2FA tokens using Shannon Entropy to see if they consistently have less than expected randomness.


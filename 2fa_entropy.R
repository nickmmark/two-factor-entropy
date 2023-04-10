## shannon entropy of random vs 2FA strings
## nick mark 2023

library(entropy)

## part 1: generate a random number and calculate the entropy of it (test code)
random_number <- sample(100000:999999, 1)
num_string <- as.character(random_number)
print(num_string)
entropy(num_string)



## part 2: calculate the entropy of 10000 random numbers
# set the number of random numbers to generate
n_numbers <- 10000

# initialize a vector to store the entropies
entropies <- numeric(n_numbers)

# generate n_numbers random 6-digit numbers and calculate their entropies
for (i in 1:n_numbers) {
  # generate a random 6-digit number
  #random_number <- sample(100000:999999, 1)

  # generate a random 8-digit number
  random_number <- sample(100000:99999999, 1)
  
  # gonvert the number to a character string
  num_string <- as.character(random_number)
  # compute the entropy of the string and store it in the vector
  entropies[i] <- entropy(num_string)
}

# compute the average and standard deviation of entropy for all of the random numbers
mean_entropy <- mean(entropies)
print(mean_entropy)
sd_entropy <- sd(entropies)
print(sd_entropy)

## part 3: measure the entropy of an array of 6 digit numebers

# load the array of Outlook 2FA tokens
#numbers <- c(059338, 203093, 088521, 844570, 001286, 444567, 868049, 987740, 393499, 574467, 042937, 720139, 783717, 600109, 457219, 508272, 747064, 551158, 413054, 742448, 870033, 374863, 489672, 856569, 134334, 802595, 603980, 648507, 945524, 186417, 610737, 552264, 654940, 964069, 904651)

# load the array of Google 2FA tokens
#numbers <- c(654665, 228258, 018589, 318108, 496465, 966409, 276292, 872798, 790606, 225880, 384753, 380566, 033805, 767658, 902493, 808720, 491476, 852434, 763824, 535193, 791198, 358267, 856442, 702500, 956261, 906910, 010452, 295959, 588784, 748264, 575990, 008650, 044167, 118292, 515368, 672483, 173786, 993161, 542175, 835775, 856056, 974347, 106009, 118917)

# load an array of BoA 2FA tokens
#numbers <- c(514916, 691012, 335093, 555763, 290267, 090424, 496211, 415021, 110608, 629004, 662290, 080752, 804280, 650600, 831685, 557925, 960994, 629166, 607645, 703059, 509860, 636965, 927266, 192992)

# load an array of Chase 2FA tokens
numbers <- c(46392603, 40272363, 48888807, 46947679, 47521146, 42506403, 40570211, 42080128)

# initialize a vector to store the entropies
entropies1 <- numeric(length(numbers))

# calculate the entropy of each number in the array
for (i in 1:length(numbers)) {
  # convert the number to a character string
  num_string <- as.character(numbers[i])
  # compute the entropy of the string and store it in the vector
  entropies1[i] <- entropy(num_string)
}

# compute the average and standard deviation of the entropy for all of the the 2FA numbers
mean_entropy <- mean(entropies1)
print(mean_entropy)
sd_entropy <- sd(entropies1)
print(sd_entropy)
print(length(entropies1))



## part 4: compare the distribution of entropy between 2FA codes and ranomly generated codes
t.test(entropies, entropies1)

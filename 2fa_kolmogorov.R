## part 1: calculate the Kolmogorov complexity of an array of random numbers

#library(stringdist)
library(accs)

# Define the number of strings in the array; typically use n=100 because the runtime gets very long...
n <- 100

# Generate an array of n random 6-digit numbers
x <- matrix(sample(0:9, 6*n, replace=TRUE), nrow=n)

# Convert the array to a character matrix
x <- apply(x, 1, paste, collapse="")

# Calculate the Kolmogorov complexity of the array
#K <- sapply(x, kolmogorovComp)
K <- sapply(x, acss)

# Print the result
cat("The Kolmogorov complexity of the random number array is:", K, "\n")
cat("The mean Kolmogorov complexity of the random number array is", mean(K[1]), "\n")
cat("The mean Kolmogorov complexity of the random number array is", mean(K[2]), "\n")



## part 2: calculate Kolmogorov complexity of an array of 2FA tokens
library(accs)

# load the 2FA values into an array
#x <- as.matrix(c(123456, 314265))
x <- as.matrix(c(654665, 228258, 018589, 318108, 496465, 966409, 276292, 872798, 790606, 225880, 384753, 380566, 033805, 767658, 902493, 808720, 491476, 852434, 763824, 535193, 791198, 358267, 856442, 702500, 956261, 906910, 010452, 295959, 588784, 748264, 575990, 008650, 044167, 118292, 515368, 672483, 173786, 993161, 542175, 835775, 856056, 974347, 106009, 118917))


# convert the array to a character matrix
x <- apply(x, 1, paste, collapse="")

# calculate the Kolmogorov complexity of the matrix
K <- sapply(x, acss)

J <- K

# Print the results
cat("The Kolmogorov complexity of the 2FA number array is:", K, "\n")
cat("The mean Kolmogorov complexity of the 2FA number array is", mean(K[1]), "\n")
cat("The mean Kolmogorov complexity of the 2FA number array is", mean(K[2]), "\n")


# part 3 - compare the distribution of Kolmogorov complexities
t.test(J[1, ], K[1, ])
t.test(J[2, ], K[2, ])

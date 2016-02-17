library(shiny)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
###   1. Load R libraries required for running the code

library("actuar")
library("stats")
library("stats4")
library("copula")
library("distr")





### 2. Input and Setup Data

###setwd("c:\\directory") # Change this to where the .csv file with the data is stored

copula_data <- read.csv("copula_data.csv", header = TRUE)

alae_data <- copula_data$alae

alae_data <- alae_data[alae_data>0] #The ALAE data will have a point mass at 0 which our fitted distributions do not account for.


set.seed(123)
rankdata <- sapply(copula_data , rank, ties.method = "random") / (nrow(copula_data) + 1)

summary(copula_data)

plot(copula_data, log="yx")
#abline(lm(copula_data[,2]~copula_data[,1]), untf = "TRUE")



### 3. ALAE Distribution Fitting




nLL1 <- function(mu, sigma) -sum(stats::dlnorm(alae_data, mu, sigma, log = TRUE)) 
# This defines a function giving the logliklihood of the data for a given set of distribution parameters. This line is for the log-normal distribution.
alae_fit1<-mle(nLL1, start = list(mu = 10, sigma = 1), method = "L-BFGS-B", nobs = length(alae_data), lower = c(1,0.01)) #This finds the distribution parameters minimizing the function defined above, i.e. the maximum liklihood fit.

nLL2 <- function(shape, scale) -sum(stats::dweibull(alae_data, shape, scale, log = TRUE)) 
# Same as above but for the Weibull distribution.
alae_fit2<-mle(nLL2, start = list(shape = 1, scale = 50000), method = "L-BFGS-B", nobs = length(alae_data), lower = c(0.1,100))

nLL3 <- function(shapelog, ratelog) -sum(actuar::dlgamma(alae_data, shapelog, ratelog, log = TRUE)) 
#Log-gamma distribution.
alae_fit3<-mle(nLL3, start = list(shapelog = 60, ratelog = 1), method = "L-BFGS-B", nobs = length(alae_data), lower = c(0.01,0.01))

nLL4 <- function(shape, scale) -sum(actuar::dpareto(alae_data, shape, scale, log = TRUE)) 
# Pareto distribution.
alae_fit4<-mle(nLL4, start = list(shape = 1.1, scale = 1000), method = "L-BFGS-B", nobs = length(alae_data), lower = c(1,100))



# The following code creates a graph displaying each of the fitted curves against the empirical distribution of the data. The x-axis is ALAE amount and the y-axis is cumulative probability of ALAE < y.

x<-seq(0,max(alae_data),max(alae_data)/1000) 
# This defines the x-axis range for the following graph to encompas all ALAE data.

#plot(x,plnorm(x,coef(alae_fit1)[1], coef(alae_fit1)[2]),type="l",col="red", main="ECDF vs Curve Fits")

#We give each distribution a different color as indicated in the code below.
#lines(x,pweibull(x,coef(alae_fit2)[1], coef(alae_fit2)[2]),type="l",col="blue")
#lines(x,plgamma(x,coef(alae_fit3)[1], coef(alae_fit3)[2]),type="l",col="orange")
#lines(x,ppareto(x,coef(alae_fit4)[1], coef(alae_fit4)[2]),type="l",col="green")
#plot(ecdf(alae_data),add=TRUE)


# At this point the user may select which fit they think is the best. I typically found the pareto to be the best fit and so the rest of the code assumes the pareto distribution is chosen. The code can be modified to make a different selection.

summary(alae_fit4) 
alae_fit4@coef






###  4. Copula Fitting



fitted_copula<-fitCopula(gumbelCopula(dim=2), rankdata, method = "ml") 
#We have assumed use of the Gumbel copula.

summary(fitted_copula)

theta <- fitted_copula@copula@parameters

tail_correlation <- 2 - 2^(1/theta)
tail_correlation 
# The upper tail correlation is one way of uniquely describing a member of a one-parameter copula family (e.g. Gumbel). 

output$copula_data.plot <- renderPlot({
  plot(rankdata)
})


### 5. Indemnity Exposure Curve loading



indexpo_data<-read.csv("indemnity_curve.csv", header = FALSE) 
#This assumes the user already has an indemnity distribution, i.e. exposure curve, they want to use.

indexpo_data[1001, 2] <- 1

supp = indexpo_data[2:1001, 1]
probs = indexpo_data[, 2][-1] -  indexpo_data[1:1000, 2]

indemnity<-DiscreteDistribution(supp, probs) 
#This just defines the cumulative distribution function of the exposure curve as a distribution object in R.











### 6. Plot the selected bivariate distribution against the actual data.



simcopula <- rCopula(nrow(copula_data), fitted_copula@copula) 
# This simulates as many random draws from the fitted copula as there are in the original dataset.


simloss <- cbind(distr::q(indemnity)(simcopula[,1]), qpareto(simcopula[,2], alae_fit4@coef["shape"], alae_fit4@coef["scale"])) 
# This uses the cumulative ALAE and loss distributions to transform the copula data, which is in terms of percentiles, into loss/ALAE amounts.


#plot(copula_data, xlim = c(0, 10^7), ylim = c(0, 1.5*10^6), main = "input data v simulated data", xlab = "indemnity", ylab = "ALAE") 
#par(new=T)
#plot(simloss, axes = F, type = "p", col=2, xlim = c(0, 10^7), ylim = c(0, 1.5*10^6), xlab = "", ylab = "")
#par(new=F)
# This is a plot of the actual data versus simulated data.





### 7. Simulation and Creation of a Loss plus ALAE distribution

n_simulations <-100000 
# Define the number of simulations to do for creation of the curve

simcopula <- rCopula(n_simulations, fitted_copula@copula) 
#Simulate random points according to the copula's probability law.

simloss <- cbind(distr::q(indemnity)(simcopula[,1]), qpareto(simcopula[,2], alae_fit4@coef["shape"], alae_fit4@coef["scale"]))


loss_alaeinc<-simloss[,1]+simloss[,2]

n_points <-1000 
#Define the number of points desired for the final empirical loss plus alae distribution. Should be orders of magnitude less than n_simulations for stability.

cumulative_prob<-c(1:n_points)/n_points

loss_dist_alaeinc <- cbind(quantile(loss_alaeinc, cumulative_prob), cumulative_prob)

write.csv(loss_dist_alaeinc, "loss_dist_alaeinc.csv") 
#Output the empirical distribution based on simulated data to a .csv file (assuming this is desired for use in some other program, spreadsheet, etc.)




### 8a. Creation of a "Burning Cost"/"Loss Cost"/ or "Pure Premium" exhibit: ALAE Included treatment



freq_at_threshold <- 16

loss_cost_exhibit_alaeinc <- read.csv("loss_cost_exhibit_input.csv", header = TRUE)

layer <- function(x, limit, attachment) pmax(0, pmin(limit, x - attachment))  
#This function calculates the reinsurance loss given the ground up loss and alae, limit and attachment.

for (i in seq(length.out=nrow(loss_cost_exhibit_alaeinc))) {
  layeredloss <- layer(simloss[,1]+simloss[,2], loss_cost_exhibit_alaeinc$limit[i], loss_cost_exhibit_alaeinc$attachment[i]) 
  #Amount of loss plus ALAE within the layer for each simulated loss.
  
  count <- sum(layeredloss > 0) 
  #Number of simulated losses over the reinsurance attachment
  mean <- mean(layeredloss) 
  #Average of the simulated layered loss. Note that layered losses of zero are included in the average.
  mean_sq <- mean(layeredloss^2) 
  #Again, zeroes included.
  
  loss_cost_exhibit_alaeinc$expected_loss[i] <- freq_at_threshold * mean 
  loss_cost_exhibit_alaeinc$frequency[i] <- count * freq_at_threshold / n_simulations
  loss_cost_exhibit_alaeinc$severity[i] <- mean * n_simulations / count 
  #Adjusting for the zeroes included in mean.
  
  loss_cost_exhibit_alaeinc$std_dev[i] <- sqrt(mean_sq * freq_at_threshold) 
  #This assumes poisson frequency. We use the threshold instead of layer frequency because the squared layer mean includes simulated losses of zero.
  
}
loss_cost_exhibit_alaeinc

write.csv(loss_cost_exhibit_alaeinc, "loss_cost_exhibit_output_ALAE_Incl.csv")



### 8b. Creation of a "Burning Cost"/"Loss Cost"/ or "Pure Premium" exhibit: ALAE Pro-rata treatment


loss_cost_exhibit_alaepr <- read.csv("loss_cost_exhibit_input.csv", header = TRUE)

for (i in seq(length.out=nrow(loss_cost_exhibit_alaepr))) {
  layeredindem <- layer(simloss[,1], loss_cost_exhibit_alaepr$limit[i], loss_cost_exhibit_alaepr$attachment[i]) 
  #Amount of indemnity falling in the layer.
  layeredloss <- layeredindem + simloss[,2] * layeredindem/simloss[,1] 
  #Reinsurance loss under ALAE pro-rata treatment which is layered indemnity plus an equal portion of the ALAE as the reinsured indemnity is of total indemnity.
  
  count <- sum(layeredloss > 0) 
  mean <- mean(layeredloss) 
  mean_sq <- mean(layeredloss^2) 
  
  loss_cost_exhibit_alaepr$expected_loss[i] <- freq_at_threshold * mean 
  loss_cost_exhibit_alaepr$frequency[i] <- count * freq_at_threshold / n_simulations
  loss_cost_exhibit_alaepr$severity[i] <- mean * n_simulations / count 
  loss_cost_exhibit_alaepr$std_dev[i] <- sqrt(mean_sq * freq_at_threshold)
}
loss_cost_exhibit_alaepr

write.csv(loss_cost_exhibit_alaepr, "loss_cost_exhibit_output_ALAE_Prorata.csv")




### 8c. Creation of a "Burning Cost"/"Loss Cost"/ or "Pure Premium" exhibit: ALAE Included treatment, Classical Assumption



ALAE_load <- 1+ sum(copula_data$alae)/sum(copula_data$loss) 
ALAE_load
# We assume that the fixed ALAE load to be applied to each claim is the total ALAE in the dataset divided by the total loss (including below the threshold), which is a typical practice.




loss_cost_exhibit_alaeinc_clsc <- read.csv("loss_cost_exhibit_input.csv", header = TRUE)

for (i in seq(length.out=nrow(loss_cost_exhibit_alaeinc_clsc))) {
  layeredloss <- layer(simloss[,1]*ALAE_load, loss_cost_exhibit_alaeinc_clsc$limit[i], loss_cost_exhibit_alaeinc_clsc$attachment[i]) 
  #We load each indemnity amount by the ALAE load and then apply the layering. The rest of the calculations are identical.
  
  count <- sum(layeredloss > 0) 
  mean <- mean(layeredloss) 
  mean_sq <- mean(layeredloss^2) 
  
  loss_cost_exhibit_alaeinc_clsc$expected_loss[i] <- freq_at_threshold * mean 
  loss_cost_exhibit_alaeinc_clsc$frequency[i] <- count * freq_at_threshold / n_simulations
  loss_cost_exhibit_alaeinc_clsc$severity[i] <- mean * n_simulations / count 
  loss_cost_exhibit_alaeinc_clsc$std_dev[i] <- sqrt(mean_sq * freq_at_threshold)
}
loss_cost_exhibit_alaeinc_clsc

write.csv(loss_cost_exhibit_alaeinc_clsc, "loss_cost_exhibit_output_ALAE_Incl_clsc.csv")




### 8d. Creation of a "Burning Cost"/"Loss Cost"/ or "Pure Premium" exhibit: ALAE Pro-rata treatment, Classical Assumption


loss_cost_exhibit_alaepr_clsc <- read.csv("loss_cost_exhibit_input.csv", header = TRUE)

for (i in seq(length.out=nrow(loss_cost_exhibit_alaepr_clsc))) {
  layeredloss <- ALAE_load*layer(simloss[,1], loss_cost_exhibit_alaepr_clsc$limit[i], loss_cost_exhibit_alaepr_clsc$attachment[i]) 
  #Exercise: Work out that this is the correct formula for reinsurance loss in this case.
  
  count <- sum(layeredloss > 0) 
  mean <- mean(layeredloss) 
  mean_sq <- mean(layeredloss^2) 
  
  loss_cost_exhibit_alaepr_clsc$expected_loss[i] <- freq_at_threshold * mean 
  loss_cost_exhibit_alaepr_clsc$frequency[i] <- count * freq_at_threshold / n_simulations
  loss_cost_exhibit_alaepr_clsc$severity[i] <- mean * n_simulations / count 
  loss_cost_exhibit_alaepr_clsc$std_dev[i] <- sqrt(mean_sq * freq_at_threshold)
}
loss_cost_exhibit_alaepr_clsc

write.csv(loss_cost_exhibit_alaepr_clsc, "loss_cost_exhibit_output_ALAE_Prorata_clsc.csv")





100*(loss_cost_exhibit_alaepr/loss_cost_exhibit_alaepr_clsc-1)[,3:6]
#Create a table of percentage differences between the two methods in the ALAE prorata case.



100*(loss_cost_exhibit_alaeinc/loss_cost_exhibit_alaeinc_clsc-1)[,3:6]
#Create a table of percentage differences between the two methods in the ALAE prorata case.


})
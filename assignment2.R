##### SECTION 1 #####

# QUESTION 1
library(astsa)
plot(ENSO)

# QUESTION 2
library(tseries)
adf.test(ENSO)
library (fpp3)
unitroot_kpss(ENSO)

# QUESTION 3
acf(ENSO)
pacf(ENSO)

# QUESTION 4

# QUESTION 5
model1=sarima(ENSO, p=3,d=0,q=0)
model1$ttable

# QUESTION 6
Box.test(resid(model1$fit) , lag =20 , type ="Ljung-Box", fitdf = 3)





##### SECTION 2 #####
# QUESTION 1
plot(cardox)

# QUESTION 2
data1=diff(cardox)#detrend
newdata=diff(data1,lag = 12) #deseason
plot(newdata)

# QUESTION 3
acf(newdata)
pacf(newdata)

# QUESTION 4
#for the pacf there is significant correlation at lag 12
#and signif corr at lag 1 for acf so it must be an sar model

# QUESTION 5
m1=sarima(newdata,1,1,1,0,1,1,12)
m2=sarima(newdata,0,1,1,0,1,1,12)
m1$AIC
m2$AIC
m1$BIC
m2$BIC

# QUESTION 6
sarima.for(cardox,4,1,1,1,0,1,1,12)


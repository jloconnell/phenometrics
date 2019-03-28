##curvature, function to create the derivative of an asymetrical (each s-shape modeled separately) phenophase curve
##this function can be used to calculate the phenophase transition date

curve<-function(x,y,a,b){
    ##y is the idex/response (eg. gcc or other phenology index)
    ##x is date/time (must be integer created by as.numeric(as.Date()) ).
    ##a and b are constants from the logistic curve fitting equation (see Zhang et al. 2003
    ##Monitoring vegetation phenology using MODIS, RSE 84: 471-475
    ##http://dx.doi.org.proxy-remote.galib.uga.edu/10.1016/S0034-4257(02)00135-9
    ##the return is the derivative of the curve
    c<-max(y)-min(y)
    e<-2.71828
    d<-min(y)
    z<-e^(a+b*x)
    #kurve<-((b^2)*c*z*(1-z)*(1+z)^3)/(((1+z)^4)+(b*c+z)^2)^(3/2)
    #plot(test$time,k)

    ##change in curve
    numerator<-(3*z*(1-z)*((1+z)^3))*(2*((1+z)^3)+z*(c^2)*(b^2))
    denominator<-(((1+z)^4)+((b*c*z)^2))^(5/2)
    first<-(numerator/denominator)
    numerator<-((1+z)^2)*(1+2*z-5*z^2)
    denominator<-(((1+z)^4)+((b*c*z)^2))^(3/2)
    second<-(numerator/denominator)
    k<-(c*z*b^3)*(first-second)
    plot(as.Date(x, origin="1970-01-01"),k, xlab="")
    return(k)
    
}

##Example, not run, test$time and test$index are time and phenology index variables (example GCC, NDVI, EVI, etc), 
##These are reduced first programatically to a single S-curve-- eg., from a phenology minima to just after the phenology maxima 

##curve function a and b variables are extracted from an nlsLM model fit

##step 1: to fit a curve to phenology data, first get the needed nlsLM model constants
#c<-max(test$index)-min(test$index)
#d<-min(test$index)

#summary(m <- nlsLM(test$index ~ (c/(1+e^(alpha+beta*test$time))+d), 
#                data=test, start = list(alpha = 0, beta = (0.0001)), 
#                control=nls.lm.control(factor=(0.000001),maxiter=300)))
#a<-as.numeric(coef(m)[1]); b<-as.numeric(coef(m)[2])
#y<-(c/(1+e^(a+b*test$time))+d)

##plot the data and the fit phenology curve from nlsLM together
#plot(test$time,test$index)
#lines(test$time, y, col="dark orange")

##caculate the derivative of the curve
#k<-curve(test$time, test$index, a,b)

##which dates represent the maxima and minima from the derivative? --these are the phenophase transition dates
#x<-which(k>0.9999*(max(k)))
#as.Date(test$time[x], origin = "1970-01-01")
#x<-which(k<0.9999*(min(k)))
#as.Date(test$time[x], origin = "1970-01-01")

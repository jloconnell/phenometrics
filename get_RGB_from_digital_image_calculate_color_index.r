##an example script, demonstrating how to load a digital image into R, 
##extract the color information and calculate a phenology index 
##see Richardson, et al. 2007. Use of digital webcam images to track spring green-up in a deciduous broadleaf forest. 
##         Oecologia, 152(2), 323–334. https://doi.org/10.1007/s00442-006-0657-z

library(biOps)

#load the Region of Interest as a mask object, 
##where the mask is a jpeg that is black in non-target regions and white in the target region
mask<-readJpeg("region_of_interest.jpg")

##Read in a digital image to extract color info from
image<-readJpeg(image_data[i,"images"])#i
  
##separate the colors and subset to the region of interest
blue <- as.array(image[,,1])
green <-as.array(image[,,2])
red <- as.array(image[,,3])

blue<-blue[mask[]>0]
green<-green[mask[]>0]
red<-red[mask[]>0]

blue<-blue[complete.cases(blue)]
green<-green[complete.cases(green)]
red<-red[complete.cases(red)]

##calculate summary color info that can be used to create phenology indices
bmean<-mean(blue)
gmean<-mean(green)
rmean<-mean(red)
brightmean<-rmean+gmean+bmean

##calculate phenology indices
gcc<-gmean/brightmean
twogrb<-2*gmean-(rmean+bmean)

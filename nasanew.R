library("raster") #load raster package
setwd("F:/nasa") #set working directory

##input population data
raster1<-raster("LC81410542017013LGN00_B1.TIF") #read current population density 
raster2<-raster("LC81410542017013LGN00_B2.TIF") #read population density with proper social distancing 
raster3<-raster("LC81410542017013LGN00_B3.TIF") #read current private vehicle usage 
raster4<-raster("LC81410542017013LGN00_B4.TIF") #read private vehicle usage with proper social distance
raster5<-raster("LC81410542017013LGN00_B5.TIF") #read Number of current walking people 
raster6<-raster("LC81410542017013LGN00_B6.TIF") #read Number of walking people with proper social distancing 
raster7<-raster("LC81410542017013LGN00_B7.TIF") #read Number of current public transport users 
raster8<-raster("LC81410542017013LGN00_B7.TIF") #read Number of public transport users with proper social distancing

##input calculated values from supervised classification
p11<-0.7 #Urban class
p12<-0.6 #Road class
p13<-0.5 #Forest class
p14<-0.4 #water class


prob1<-overlay(raster1,raster2,
  
  fun=function(r1,r2){
  
    return( r1/r2)
  })
prob2<-overlay(raster3,raster4,
            fun=function(r3,r4){
              
              return( r3/r4)
            })
prob3<-overlay(raster5,raster6,
            fun=function(r5,r6){
              
              return( r5/r6)
            })
prob4<-overlay(raster7,raster8,
            fun=function(r7,r8){
              
              return( r7/r8)
            })
pSD<-overlay(prob1,prob2,prob3,prob4,
            fun=function(p1,p2,p3,p4){
              
              return(p1+(1-p1)*(p2+p3+p4))
            })

if((p11>p13)&&(p11>p14)&&(p12>p13)&&(p12>p14)){
pF1<-p11*pSD
pF2<-p12*pSD}
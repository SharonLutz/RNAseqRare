RNAseqRare <-
function(x,y,z=NULL){

  RNAseqErrorCheck(x,y,z)
  
library(MASS)
library(SKAT)

#########################
## format data
#########################

dataN<-cbind(x,y)
dataN<-na.omit(dataN)
x<-dataN[,1:(ncol(dataN)-1)]
y<-dataN[,ncol(dataN)]

# format X to be a matrix
X<-matrix(0,nrow=nrow(x),ncol=ncol(x))
for(pp in 1:ncol(x)){X[,pp]<-x[,pp]}

xSum<-rowSums(X)
xI<-xSum
xI[xSum>0]<-1

#########################
## SKAT with normalized y
#########################
yn = normscore(y)
if(length(z)==0){obj1<-SKAT_Null_Model(yn ~ 1, out_type="C")
	}else{obj1<-SKAT_Null_Model(yn ~ z, out_type="C")}

skatN<-SKAT(X, obj1,r.corr=seq(0,1,by=0.01))$p.value

#########################
## glm with sum and indicator
#########################
if(length(z)==0){glmNMs<-summary(glm.nb(y ~ xSum))$coef
	}else{glmNMs<-summary(glm.nb(y ~ xSum+z))$coef}
		
if(length(z)==0){glmNMi<-summary(glm.nb(y ~ xI))$coef
}else{glmNMi<-summary(glm.nb(y ~ xI+z))$coef}
	
#########################
## output
#########################
output<-list(skatN,glmNMs,glmNMi)
names(output)<-c("p-value from SKAT with normalized count data","negative binomial with sum of rare variants","negative binomial with indicator for rare variants")

output}

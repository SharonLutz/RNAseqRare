## RNAseqRare
The RNAseqRare R package performs expression quantitative trait loci (eQTL) analyses of rare variants for RNA-seq data. 

#### Installation
```
install.packages("devtools") # The devtools package must be installed first
install.packages("MASS") # The MASS package must be installed first
install.packages("SKAT") # The SKAT package must be installed first

devtools::install_github("SharonLutz/RNAseqRare")
```
#### Example
For the given dataset dataR, one can test if the read counts (i.e. Y) are associated with a collection of rare variants (i.e. X). The code below runs this analysis.
```
library(RNAseqRare)
?RNAseqRare # For details on this function and how to choose input variables

data("dataR")
y<-dataR[,"y"] 
x<-dataR[,1:124]
RNAseqRare(x,y)
```

#### Output
For this analysis, the rare variants in the region (i.e. X) are associated with the given read counts (i.e. Y) for all 3 methods: method 1 using SKAT with the normalized count data, method 2 using a negative binomial regression with the sum of rare variants in the region, and method 3 using a negative binomial regression with an indicator for rare variants in the region.
```
$`p-value from SKAT with normalized count data`
[1] 0.04538739

$`negative binomial with sum of rare variants`
              Estimate Std. Error   z value     Pr(>|z|)
(Intercept) 2.57019238  0.1457844 17.630096 1.447218e-69
xSum        0.06925349  0.0382376  1.811136 7.011982e-02

$`negative binomial with indicator for rare variants`
             Estimate Std. Error   z value     Pr(>|z|)
(Intercept) 2.3978953  0.2182372 10.987562 4.386143e-28
xI          0.4629861  0.2514543  1.841234 6.558733e-02

```
#### Reference
**Lutz SM**, Thwing A, Fingerlin TE. (2017) A Statistical Framework for Rare Variant Associations with RNA-seq Data.  (Submitted)


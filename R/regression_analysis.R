#Models in the paper 
vehinsmodel <- lm(log(AdjVEHINSPQ) ~ HOUSB+AGE_REF+factor(CUTENURE)+FAM_SIZE+TINCHRS+factor(MARITAL1)+factor(REF_RACE)+SEX_REF+VEHQ+GASMOPQ+VEHFINPQ+MAINRPPQ+VRNTLOPQ+PUBTRAPQ+factor(STATE)+EVEHPURP+HISP_REF+factor(HIGH_EDU)+factor(QSQ118), data=ces_capstone)
summary(vehinsmodel)

lifinsmodel<- lm(log(AdjLIFINSPQ) ~ HOUSB+AGE_REF+factor(CUTENURE)+FAM_SIZE+TINCHRS+factor(MARITAL1)+factor(REF_RACE)+SEX_REF+ALCBEVPQ+TOBACCPQ+factor(STATE)+HISP_REF+factor(HIGH_EDU)+QSQ118, data = ces_capstone)
summary(lifinsmodel)

perinsmodel <- lm(log(AdjPERINSPQ) ~ HOUSB+AGE_REF+factor(CUTENURE)+FAM_SIZE+TINCHRS+factor(MARITAL1)+factor(REF_RACE)+SEX_REF+factor(STATE)+HISP_REF+factor(HIGH_EDU)+QSQ118, data= ces_capstone)
summary(perinsmodel)

hlthinsmodel <-lm(log(AdjHLTHINPQ) ~ HOUSB+AGE_REF+factor(CUTENURE)+FAM_SIZE+TINCHRS+factor(MARITAL1)+factor(REF_RACE)+SEX_REF+FOODPQ+ALCBEVPQ+MEDSRVPQ+PREDRGPQ+MEDSUPPQ+TOBACCPQ+factor(STATE)+HISP_REF+factor(HIGH_EDU)+QSQ118,data=ces_capstone)
summary(hlthinsmodel)

#Robust Standard Errors

library(lmtest)
library(sandwich)

coeftest(vehinsmodel,vcov. = vcovHC(vehinsmodel, type = "HC3"))

coeftest(lifinsmodel,vcov. = vcovHC(lifinsmodel, type = "HC3"))

coeftest(perinsmodel,vcov. = vcovHC(perinsmodel, type = "HC3"))

coeftest(hlthinsmodel,vcov. = vcovHC(hlthinsmodel, type = "HC3"))

#Models with factored Quarters
vehinsmodel1 <- lm(log(AdjVEHINSPQ) ~ HOUSB+AGE_REF+factor(CUTENURE)+FAM_SIZE+TINCHRS+factor(MARITAL1)+factor(REF_RACE)+SEX_REF+VEHQ+GASMOPQ+VEHFINPQ+MAINRPPQ+VRNTLOPQ+PUBTRAPQ+factor(STATE)+EVEHPURP+HISP_REF+factor(HIGH_EDU)+factor(QSQ118), data=ces_capstone)
summary(vehinsmodel1)

lifinsmodel1<- lm(log(AdjLIFINSPQ) ~ HOUSB+AGE_REF+factor(CUTENURE)+FAM_SIZE+TINCHRS+factor(MARITAL1)+factor(REF_RACE)+SEX_REF+ALCBEVPQ+TOBACCPQ+factor(STATE)+HISP_REF+factor(HIGH_EDU)+factor(QSQ118), data = ces_capstone)
summary(lifinsmodel1)

perinsmodel1 <- lm(log(AdjPERINSPQ) ~ HOUSB+AGE_REF+factor(CUTENURE)+FAM_SIZE+TINCHRS+factor(MARITAL1)+factor(REF_RACE)+SEX_REF+factor(STATE)+HISP_REF+factor(HIGH_EDU)+factor(QSQ118), data= ces_capstone)
summary(perinsmodel1)

hlthinsmodel1 <-lm(log(AdjHLTHINPQ) ~ HOUSB+AGE_REF+factor(CUTENURE)+FAM_SIZE+TINCHRS+factor(MARITAL1)+factor(REF_RACE)+SEX_REF+FOODPQ+ALCBEVPQ+MEDSRVPQ+PREDRGPQ+MEDSUPPQ+TOBACCPQ+factor(STATE)+HISP_REF+factor(HIGH_EDU)+factor(QSQ118),data=ces_capstone)
summary(hlthinsmodel1)

#Robust Standard Errors of factored Quarter models
coeftest(vehinsmodel1, vcov. = vcovHC(vehinsmodel1, type = "HC3"))

coeftest(lifinsmodel1,vcov. = vcovHC(lifinsmodel1, type = "HC3"))

coeftest(perinsmodel1,vcov. = vcovHC(perinsmodel1, type = "HC3"))

coeftest(hlthinsmodel1,vcov. = vcovHC(hlthinsmodel1, type = "HC3"))

#Extra Analysis 
vehinsmodel2 <- lm(log(AdjVEHINSPQ) ~ HOUSB+I(HOUSB^2)+AGE_REF+factor(CUTENURE)+FAM_SIZE+TINCHRS+factor(MARITAL1)+factor(REF_RACE)+SEX_REF+VEHQ+log(GASMOPQ+1)+log(VEHFINPQ+1)+log(MAINRPPQ+1)+log(VRNTLOPQ+1)+log(PUBTRAPQ+1)+factor(STATE)+log(EVEHPURP+1)+HISP_REF+factor(HIGH_EDU)+factor(QSQ118), data=ces_capstone)
summary(vehinsmodel2)

lifinsmodel2<- lm(log(AdjLIFINSPQ) ~ HOUSB+I(HOUSB^2)+AGE_REF+factor(CUTENURE)+FAM_SIZE+TINCHRS+factor(MARITAL1)+factor(REF_RACE)+SEX_REF+ALCBEVPQ+log(TOBACCPQ+1)+factor(STATE)+HISP_REF+factor(HIGH_EDU)+factor(QSQ118), data = ces_capstone)
summary(lifinsmodel2)

perinsmodel2 <- lm(log(AdjPERINSPQ) ~ HOUSB+I(HOUSB^2)+AGE_REF+factor(CUTENURE)+FAM_SIZE+TINCHRS+factor(MARITAL1)+factor(REF_RACE)+SEX_REF+factor(STATE)+HISP_REF+factor(HIGH_EDU)+factor(QSQ118), data= ces_capstone)
summary(perinsmodel2)

hlthinsmodel2 <-lm(log(AdjHLTHINPQ) ~ HOUSB+I(HOUSB^2)+AGE_REF+factor(CUTENURE)+FAM_SIZE+TINCHRS+factor(MARITAL1)+factor(REF_RACE)+SEX_REF+log(FOODPQ+1)+log(ALCBEVPQ+1)+log(MEDSRVPQ+1)+log(PREDRGPQ+1)+log(MEDSUPPQ+1)+log(TOBACCPQ+1)+factor(STATE)+HISP_REF+factor(HIGH_EDU)+factor(QSQ118),data=ces_capstone)
summary(hlthinsmodel2)

#Robust Standard Errors for the Extra Analysis Models 
coeftest(vehinsmodel2, vcov. = vcovHC(vehinsmodel2, type = "HC3"))

coeftest(lifinsmodel2, vcov. = vcovHC(lifinsmodel2, type = "HC3"))

coeftest(perinsmodel2, vcov. = vcovHC(perinsmodel2, type = "HC3"))

coeftest(hlthinsmodel2, vcov. = vcovHC(hlthinsmodel2, type = "HC3"))

#Breusch-Pagan test results
bp_results <- list(Vehicle = bptest(vehinsmodel), Life = bptest(lifinsmodel), Personal = bptest(perinsmodel), Health = bptest(hlthinsmodel))
bp_results

bp_results1 <- list(Vehicle = bptest(vehinsmodel1), Life = bptest(lifinsmodel1), Personal = bptest(perinsmodel1), Health = bptest(hlthinsmodel1))
bp_results1

bp_results2 <- list(Vehicle = bptest(vehinsmodel2), Life = bptest(lifinsmodel2), Personal = bptest(perinsmodel2), Health = bptest(hlthinsmodel2))
bp_results2

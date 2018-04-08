# Bayesian approach to estimate 'Relative Excess Risk Due to Interaction'

This repository contains codes to fit Linear excess relative risk estimated using Odds ratios as suggested by [David B. Richardson, Jay S. Kaufman,American Journal of  Epidemiology,2010](https://doi.org/10.1093/aje/kwn411). [Haitao Chu, Stephen R Cole](https://insights.ovid.com/pubmed?pmid=21228700) proposed Bayesian approach to the model for two binary exposures.   

Briefly the model is, 
$$odds_{i} = exp(\alpha)*(1+\beta_{1}*x_{1,i} + \beta_{2}*x_{2,i} + \beta_{3}*x_{1,i}*x_{2,i})$$  
$$P(y_{i} = 1) = \frac{odds_{i}}{1+odds_{i}}$$  

With the following constrains on parameters
$$ \beta_{1} , \beta_{2} >= -1 $$  
$$ \beta_{3} >= -(1+\beta_{1} + \beta_{2})$$

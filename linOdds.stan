data{
  int N;
  vector[N] A;
  vector[N] B;
  int<lower=0, upper=1> y[N];
}
parameters{
  real b0;
  real<lower=-1> b1;
  real<lower=-1> b2;
  real<lower=-(1+b1+b2)> b3;
}
transformed parameters{
  vector<lower=0>[N] odds;
  vector<lower=0,upper=1>[N] pr;
  
  for(i in 1:N){
    odds[i] = exp(b0)*(1+b1*A[i]+b2*B[i]+b3*A[i]*B[i]);
    pr[i] = odds[i]/(1+odds[i]);
  }
}
model{
  b0 ~ normal(0,5);
  b1 ~ normal(0,5);
  b2 ~ normal(0,5);
  b3 ~ normal(0,5);
  
  y ~ bernoulli(pr);
}
generated quantities{
  vector[N] yrep;
  for(i in 1:N){
    yrep[i] = bernoulli_rng(pr[i]);
  }
}

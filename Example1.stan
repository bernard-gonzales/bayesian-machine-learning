//
// This Stan program defines a simple model, with a
// vector of values 'y' modeled as normally distributed
// with mean 'mu' and standard deviation 'sigma'.
//
// Learn more about model development with Stan at:
//
//    http://mc-stan.org/users/interfaces/rstan.html
//    https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
//

// The input data is a vector 'y' of length 'N'.
data {
  int<lower=0> A;
  int<lower=0> F;
  vector[A] a_alc;
  vector[F] f_alc;
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  real a_mu;
  real f_mu;
  real<lower=0> a_sigma;
  real<lower=0> f_sigma;
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  a_mu ~ normal(0, 10);
  f_mu ~ normal(0, 10);
  a_sigma ~ cauchy(0, 2.5);
  f_sigma ~ cauchy(0, 2.5);
  a_alc ~ normal(a_mu, a_sigma);
  f_alc ~ normal(f_mu, f_sigma);
}

generated quantities {
  real mean_diff;
  mean_diff = a_mu - f_mu;
}


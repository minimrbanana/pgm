function g = denoising_grad_llh(T, N, sigma)
g = double((N - T)/(sigma^2));

end
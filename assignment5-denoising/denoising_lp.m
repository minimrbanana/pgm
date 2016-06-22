function lp = denoising_lp(T, N, sigma)
[n,m] = size(T);
% log_likelihood
log_likelihood = -(norm(N-T)^2)/(2*sigma^2);
% log_prior
fH = T(1:n-1,:) - T(2:n,:);
fV = T(:,1:m-1) - T(:,2:m);
log_prior = -(norm(fH)^2+norm(fV)^2)/(2*sigma^2);
% log_posterior
lp = log_likelihood + log_prior;
end


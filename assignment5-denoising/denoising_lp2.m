function lp = denoising_lp2(T, N, sigma, alpha)
[n,m] = size(T);
N=double(N);
T=double(T);
% log_likelihood
log_likelihood = -(norm(N-T)^2)/(2*sigma^2);
% log_prior
fH=zeros(n,m);
fV=zeros(n,m);
fH(1:n-1,:) = T(1:n-1,:) - T(2:n,:);
fV(:,1:m-1) = T(:,1:m-1) - T(:,2:m);
logfH = -alpha*log((1+(fH.^2)/2/(sigma^2)));
logfV = -alpha*log((1+(fV.^2)/2/(sigma^2)));
log_prior = sum(sum(logfH+logfV));
% log_posterior
lp = log_likelihood + log_prior;
end
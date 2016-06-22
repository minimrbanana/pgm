%% Gibbs sampler
function [x1,x2]=GibbsSampler(N,p,isplot)
%% 
miu1 = 0;
miu2 = 0;
sigma1 = 1;
sigma2 = 1;
%p = 0.5;
cov = [sigma1^2 p*sigma1*sigma2; p*sigma1*sigma2 sigma2^2];
%N = 10000;% number of sample
%% init sample
x1 = zeros(N,1);
x2 = zeros(N,1);
x1(1) = normrnd(miu1,sigma1);
x2(1) = normrnd(miu2,sigma2);
%% conditional distribution
for i = 2:N
    if mod(i,2)==0
        % x1 given x2
        miu1given2 = miu1 + cov(1,2)/cov(2,2)*(x2(i-1)-miu2);
        sigma1given2 = cov(1,1) - cov(1,2)/cov(2,2)*cov(2,1);
        x1(i) = normrnd(miu1given2,sigma1given2);
        x2(i) = x2(i-1);
    else
        % x2 given x1
        miu2given1 = miu2 + cov(2,1)/cov(1,1)*(x1(i-1)-miu1);
        sigma2given1 = cov(2,2) - cov(2,1)/cov(1,1)*cov(1,2);
        x2(i) = normrnd(miu2given1,sigma2given1);
        x1(i) = x1(i-1);
    end
end
if isplot
    h = figure(2);
    set(h,'Visible', 'off');
    plot(x1,x2);
    str = sprintf('Gibbs Sampling with p = %.2f.', p);
    title(str);
end
end
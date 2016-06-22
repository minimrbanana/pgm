%% M-H
function [xSample,count] = MetropolisHastings(N, sigma_p)
%% para setting
w1 = 0.3;
w2=  0.7;
miu1 = 0;
miu2 = 10;
sigma1 = 2;
sigma2 = 2;
%% init
x = w1*normrnd(miu1,sigma1)+w2*normrnd(miu2,sigma2);
xSample = zeros(1,N);
xSample(1) = x;
count = 1;
i=2;
while i<=N
    x_prime = normrnd(x,sigma_p);
    px_prime = pstar( x_prime,w1,w2,miu1,miu2,sigma1,sigma2);
    px = pstar( x,w1,w2,miu1,miu2,sigma1,sigma2);
    pAccept = min(1,px_prime/px);
    if binornd(1,pAccept,1,1)
        xSample(i) = x_prime;
        i=i+1;
    end
    count=count+1;
end
fprintf('N=%d, sigma_p=%3.1f, AcceptRate = %.4f.\n',N,sigma_p,N/count);
h = figure(3);
set(h,'Visible','off');
hist(xSample,N/10);
str = sprintf('N = %d, sigma_p = %3.1f, AcceptRate = %.4f.',N,sigma_p,N/count);
title(str);
end
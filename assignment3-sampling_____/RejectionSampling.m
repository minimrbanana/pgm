function [samples,AcceptRatiol] = RejectionSampling( N, miu_m )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%% init
lambda = 1;
miu = 0;
sigma = 1;
count = 0;
samples = zeros(1,N);
i = 1;
M = (sigma^2)*lambda+miu;
if miu_m>=M
    M = exp(-((miu_m-miu)^2)/(2*sigma^2))/lambda;
else
    M = exp((lambda*sigma)^2/2+lambda*(miu-miu_m))/lambda;
end
while i<=N
    %% q(x)
    u = unifrnd(0,1);
    x = -log(1-u)/lambda+miu_m;
    qx = lambda*exp(-lambda*(x-miu_m));
    %% p(x)
    if x >miu_m
        px = exp(-((x-miu)^2)/(2*sigma^2));
    else
        px = 0;
    end
    AcceptRate = px/(M*qx);
    if binornd(1,AcceptRate,1,1)
        samples(i) = x;
        i=i+1;
    end
    count = count+1;
end
AcceptRatiol = N/count;
end


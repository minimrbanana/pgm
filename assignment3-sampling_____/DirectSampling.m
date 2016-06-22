%% direct sampling
function [samples,AcceptRatiol] = DirectSampling( N, miu_m )
lambda = 1;
miu = 0;
sigma = 1;
count = 0;
samples = zeros(1,N);
i = 1;
while i<=N
    x = miu + sigma*randn(1);
    if x>=miu_m
        samples(i)=x;
        i=i+1;
    end
    count=count+1;
end
AcceptRatiol = N/count;
end
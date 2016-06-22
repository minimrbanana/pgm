%% script
% Zhongjie YU & Xiaoyu SHEN
% SID 2557816 & 2561562
delete *.jpg
close all;
%% 1.1
N = 10000;

miu_m = -1;
[samplesR,AcceptRatiolR] = RejectionSampling( N, miu_m );
figure(10);
hist(samplesR,N/10);
filename = sprintf('Rejection.miu%1.1fAR.%.4f.jpg',miu_m,AcceptRatiolR);
title(filename(1:end-4));
saveas(gcf,filename,'jpg');

[samplesD,AcceptRatiolD] = DirectSampling( N, miu_m );
figure(11);
hist(samplesD,N/10);
filename = sprintf('Direct.miu%1.1fAR.%.4f.jpg',miu_m,AcceptRatiolD);
title(filename(1:end-4));
saveas(gcf,filename,'jpg');

miu_m = 1;
[samplesR,AcceptRatiolR] = RejectionSampling( N, miu_m );
figure(12);
hist(samplesR,N/10);
filename = sprintf('Rejection.miu%1.1fAR.%.4f.jpg',miu_m,AcceptRatiolR);
title(filename(1:end-4));
saveas(gcf,filename,'jpg');

[samplesD,AcceptRatiolD] = DirectSampling( N, miu_m );
figure(13);
hist(samplesD,N/10);
filename = sprintf('Direct.miu%1.1fAR.%.4f.jpg',miu_m,AcceptRatiolD);
title(filename(1:end-4));
saveas(gcf,filename,'jpg');
%% 2.1
N = 10000;
isplot = 1;
for p=[0 0.5 0.8]
    GibbsSampler(N,p,isplot);
    filename = sprintf('Gibbs_p%1.1f.jpg',p);
    saveas(gcf,filename,'jpg');
end

%% 2.2
N=10000;
p=0.5;
n=100;
f=zeros(1,100);
isplot = 0;
for i=1:100
    [x1,x2] = GibbsSampler(N,p,isplot);
    ind1 = (x1>=1)&(x1<=2);
    n1 = sum(ind1);
    x2 = x2.*ind1;
    ind2 = (x2>=1)&(x2<=2);
    n2 = sum(ind2)+eps;
    f(i) = n2/n1;
end
Ef = mean(f);
fprintf('Ef = %f.\n',Ef);
%% 3.1
for N = [100 1000 10000]
    for sigma_p = [0.1 1 10 100]
        [xSample,count] = MetropolisHastings(N,sigma_p);
        filename = sprintf('N_%d_SigmaP_%3.1f.jpg',N,sigma_p);
        saveas(gcf,filename,'jpg');
    end
end

close all;
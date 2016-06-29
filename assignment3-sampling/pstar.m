function px = pstar( x,w1,w2,miu1,miu2,sigma1,sigma2)
% mixture Gaussian density function
%   Detailed explanation goes here
px = w1*1/sqrt(2*pi*sigma1)*exp(-((x-miu1)^2)/(2*sigma1^2))+w2*1/sqrt(2*pi*sigma2)*exp(-((x-miu2)^2)/(2*sigma2^2));

end


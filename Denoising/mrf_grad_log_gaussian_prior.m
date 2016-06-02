function g = mrf_grad_log_gaussian_prior(T, sigma)
[n,m] = size(T);
T = double(T);
pH1 = zeros(n,m);
pH2 = zeros(n,m);
pV1 = zeros(n,m);
pV2 = zeros(n,m);
pH1(1:n-1,:) = -(T(1:n-1,:)-T(2:n,:))/(sigma^2);
pV1(:,1:m-1) = -(T(:,1:m-1)-T(:,2:m))/(sigma^2);
pH2(2:n,:) = (T(1:n-1,:)-T(2:n,:))/(sigma^2);
pV2(:,2:m) = (T(:,1:m-1)-T(:,2:m))/(sigma^2);
g = pH1+pH2+pV1+pV2;
end
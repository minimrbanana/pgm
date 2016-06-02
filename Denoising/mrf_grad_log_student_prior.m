function g = mrf_grad_log_student_prior(T, sigma, alpha)
[n,m] = size(T);
pH1 = zeros(n,m);
pH2 = zeros(n,m);
pV1 = zeros(n,m);
pV2 = zeros(n,m);
diff = double(T(1:n-1,:)-T(2:n,:));
fH = double(1+(diff.^2)/(2*sigma^2));
pH1(1:n-1,:) = -alpha/(sigma^2)*diff.*fH.^(-1);
pH2(2:n,:) = alpha/(sigma^2)*diff.*fH.^(-1);
diff = double(T(:,1:m-1)-T(:,2:m));
fV = double(1+(diff.^2)/(2*sigma^2));
pV1(:,1:m-1) = -alpha/(sigma^2)*diff.*fV.^(-1);
pV2(:,2:m) = alpha/(sigma^2)*diff.*fV.^(-1);
g = pH1+pH2+pV1+pV2;
end
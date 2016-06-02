function T = denoising_grad_ascent2(N, sigma, eta)
N = double(N);
iter = 1000;
T = N;
i=1;

while i<iter
    diff = denoising_grad_llh(T, N, sigma)+mrf_grad_log_student_prior(T, sigma,1);
    T = T + eta*diff;
    i=i+1;
end
M = max(max(T));
m = min(min(T));
T = uint8((T-m)*(255/(M-m)));
end
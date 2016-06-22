function N = add_noise(T, sigma)
T = double(T);
noise = randn(size(T))*sigma;
N = T + noise;
N = min(255,max(0,round(N)));
N = uint8(N);
end
T = imread('la.png');
psnr0=zeros(1,5);
psnr1=zeros(1,5);
sigmas = [0.1,1,10,100,1000];
for i=1:5;
    sigma = sigmas(i);
    N = add_noise(T,sigma);
    nsize = 5;
    M = median_filter(N, nsize);
    psnr0(i) = calc_psnr(T, N);
    psnr1(i) = calc_psnr(T, M);
end
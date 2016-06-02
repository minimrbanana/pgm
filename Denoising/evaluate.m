close all;
%% median artificial
T1 = toy_stripes(200,200,20);
T2 = toy_checkerboard(200,200,20);
N1 = add_sp_noise(T1,0.1);
N2 = add_sp_noise(T2,0.1);
nsize = 7;
M1 = median_filter(N1, nsize);
M2 = median_filter(N2, nsize);
psnr_s0 = calc_psnr(T1, N1);
psnr_s1 = calc_psnr(T1, M1);
psnr_c0 = calc_psnr(T2, N2);
psnr_c1 = calc_psnr(T2, M2);
figure(1),imshow(T1);
figure(2),imshow(T2);
figure(3),imshow(N1);
figure(4),imshow(N2);
figure(5),imshow(M1);
figure(6),imshow(M2);
%% median la.png
T = imread('la.png');
sigma = 25;
N = add_noise(T,sigma);
nsize = 7;
M = median_filter(N, nsize);
psnr_la0 = calc_psnr(T, N);
psnr_la1 = calc_psnr(T, M);
figure(7),imshow(T);
figure(8),imshow(N);
figure(9),imshow(M);
%% MRF artificial
sigma = 25; eta = 1;
MRF1 = denoising_grad_ascent(N1, sigma, eta);
psnr_s2 = calc_psnr(T1, MRF1);
MRF2 = denoising_grad_ascent(N2, sigma, eta);
psnr_c2 = calc_psnr(T2, MRF2);
figure(10),imshow(MRF1);
figure(11),imshow(MRF2);
%% MRF la.png
MRF = denoising_grad_ascent(N, sigma, eta);
psnr_la2 = calc_psnr(T, MRF);
figure(12),imshow(MRF);






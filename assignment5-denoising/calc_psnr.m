function psnr = calc_psnr(T, N)
[n,m] = size(T);
err = (norm(T-N))^2/(n*m);
psnr = 20*log10(255/sqrt(err));
end
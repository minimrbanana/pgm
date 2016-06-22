function T = median_filter(N, nsize)
[n,m] = size(N);
T = zeros(n,m);
edge = round((nsize-1)/2);
N1 = zeros(n+nsize-1,m+nsize-1);
N1(edge+1:edge+n,edge+1:edge+m) = N;
% mirror the edge
for i=1:edge
    N1(i,:) = N1(nsize-i,:);
    N1(n+edge+i,:) = N1(n+edge+1-i,:);
end
for i=1:edge
    N1(:,i) = N1(:,nsize-i);
    N1(:,n+edge+i) = N1(:,n+edge+1-i);
end
for i=1+edge:n+edge
    for j=1+edge:m+edge
        mask = N1(i-edge:i+edge,j-edge:j+edge);
        mask = reshape(mask,1,nsize*nsize);
        T(i-edge,j-edge) = median(mask);
    end
end
T = uint8(T);
end
        


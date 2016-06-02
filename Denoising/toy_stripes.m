function T = toy_stripes(n, m, sSize)
flag = 255;%white
T = zeros(n,m);
for i=1:m
    T(:,i) = max(0,flag);
    if mod(i,sSize)==0
        flag = -flag;
    end
end
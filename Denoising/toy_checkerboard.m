function T = toy_checkerboard(n, m, cSize)
flag = 255;%white
line = zeros(1,m);
T = zeros(n,m);
for i=1:m
    line(1,i) = flag;
    if mod(i,cSize)==0
        flag = -flag;
    end
end
for i=1:n
    T(i,:) = max(line,0);
    if mod(i,cSize)==0
        line = -line;
    end
end
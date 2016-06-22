function N = add_sp_noise(T, p)
[n,m] = size(T);
N = T;
for i=1:n
    for j=1:m
        noise = random('bino',1,p);
        if noise==1
            color = random('bino',1,0.5);
        else
            color = -1;
        end
        switch color
            case 0
                N(i,j) = 255;% white
            case 1
                N(i,j) = 0; % black
        end
    end
end
end
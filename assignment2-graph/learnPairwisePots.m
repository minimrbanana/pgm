function pairwisePots = learnPairwisePots( train )
%learnPairwisePots
%   input    train data
%   outout   ML estimation of miu and sigma
%

pairwisePots = cell(6,2);
for i=1:6
    Lo = train{1,i};
    for j=1:6
        Li = train{1,j};
        dx = Li(:,1)-Lo(:,1);
        dy = Li(:,2)-Lo(:,2);
        miu(1,1) = mean(dx);
        miu(1,2) = mean(dy);
        sigma(1,1) = cov(dx);
        sigma(1,2) = cov(dy);
        pairwisePots{i,1}(j,:) = miu(1,:);
        pairwisePots{i,2}(j,:) = sigma(1,:);
    end
end

end


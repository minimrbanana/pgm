function maxstates = minsum(pairwisePots, unaryPots)
%minsum
%   input       pairwisePots
%               unaryPots
%   output      maxstates
%



L_shift = cell(6,1);
DTvalue = cell(6,1);
sum = zeros(size(unaryPots{1}));
%torso
for i=1:5
    L_shift{i} = -log(shiftimg(unaryPots{1,i}, pairwisePots{i, 1}(6,:), eps));
    DTvalue{i} = DT(L_shift{i}, [pairwisePots{i,2}(6,1) 0;0 pairwisePots{i,2}(6,2)]);
    sum = sum + DTvalue{i}; 
end
scoremap = sum - log(unaryPots{1,6});
[maxstates(6,2),maxstates(6,1)] = find(scoremap==min(min(scoremap)));

%limbs
for i=1:5
    F_shift = shiftimg(scoremap-DTvalue{i},pairwisePots{6,1}(i,:), 1/eps);
    DTvalue2 = DT(F_shift,[pairwisePots{i,2}(6,1) 0;0 pairwisePots{i,2}(6,2)]);
    scoremap2 = DTvalue2 - log(unaryPots{1,i});
    [maxstates(i,2),maxstates(i,1)] = find(scoremap2==min(min(scoremap2)));
    
end


end


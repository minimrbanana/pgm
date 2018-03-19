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
    % value from Li to L6
    L_shift{i} = -log(shiftimg(unaryPots{1,i}, pairwisePots{i, 1}(6,:), eps));
    DTvalue{i} = DT(L_shift{i}, [pairwisePots{i,2}(6,1) 0;0 pairwisePots{i,2}(6,2)]);
    % get the total message to L6 (sum in log, product in general)
    sum = sum + DTvalue{i}; 
end
% count in the message from L6
scoremap = sum - log(unaryPots{1,6});
% find the max state (min in -log)
[maxstates(6,2),maxstates(6,1)] = find(scoremap==min(min(scoremap)));

%limbs
for i=1:5
    % message from L6 to i^th node, 
    % message from Li deduced from result "scoremap"
    F_shift = shiftimg(scoremap-DTvalue{i},pairwisePots{6,1}(i,:), 1/eps);
    DTvalue2 = DT(F_shift,[pairwisePots{i,2}(6,1) 0;0 pairwisePots{i,2}(6,2)]);
    % count in the message from Li
    scoremap2 = DTvalue2 - log(unaryPots{1,i});
    [maxstates(i,2),maxstates(i,1)] = find(scoremap2==min(min(scoremap2)));  
end


end


function maxstates = sumproduct(pairwisePots, unaryPots)
%sumproduct
%   input       pairwisePots
%               unaryPots
%   output      maxstates
%

maxstates = zeros(6,2);

% load likelihoods
L1 = unaryPots{1,1};
L2 = unaryPots{1,2};
L3 = unaryPots{1,3};
L4 = unaryPots{1,4};
L5 = unaryPots{1,5};
L6 = unaryPots{1,6};


% first calculate the marginal of L6
% which is propagated from L1...5 to L6
scoremap1 = L6;
ftorso = cell(1, 6);
ftorso{1,6} = L6;
for i=1:5
    % prior of pair-wise model
    miu = pairwisePots{6,1}(i,:);
    cov = pairwisePots{6,2}(i,:);
    sigma = [sqrt(cov(1)) sqrt(cov(2))];
    % use convolution to get the sum
    x = floor(-6*sigma(1)):ceil(6*sigma(1));
    y = floor(-6*sigma(2)):ceil(6*sigma(2));
    gx = 1/sqrt(2*pi*sigma(1))*exp(-(x-0).^2/sigma(1));
    gy = 1/sqrt(2*pi*sigma(2))*exp(-(y-0).^2/sigma(2));
    simg = shiftimg(unaryPots{1,i}, -miu, 0);
    % the message from Li to L6:
    ftorso{1,i} = conv2(gx,gy,simg,'same');
    % multiply the message to get the marginal
    scoremap1 = ftorso{1,i} .* scoremap1;   
end
% "scoremap1" is the marginal of L6
[maxstates(6,2),maxstates(6,1)] = find(scoremap1==max(max(scoremap1)));

% then calculate the marginal of L1 to L5
for i=1:5
    % message from the other 5 nodes, 
    % is the product of 6 message divided by the i^th message  
    scoremap2 = scoremap1 ./ftorso{1,i};
    % prior of pair-wise model
    miu = pairwisePots{i,1}(6,:);
    cov = pairwisePots{i,2}(6,:);
    sigma = [sqrt(cov(1)) sqrt(cov(2))];
    % use convolution to get the sum
    x = floor(-6*sigma(1)):ceil(6*sigma(1));
    y = floor(-6*sigma(2)):ceil(6*sigma(2));
    gx = 1/sqrt(2*pi*sigma(1))*exp(-(x-0).^2/sigma(1));
    gy = 1/sqrt(2*pi*sigma(2))*exp(-(y-0).^2/sigma(2));
    simg = shiftimg(scoremap2, -miu, 0);
    % message from others to Li = (message from the 5)*(message from i^th)
    scoremap2 = conv2(gx,gy,simg,'same') .* unaryPots{1,i};
    [maxstates(i,2),maxstates(i,1)] = find(scoremap2==max(max(scoremap2)));  
end






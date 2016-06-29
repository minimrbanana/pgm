clc;
load('data.mat');

pairwisePots = learnPairwisePots(train);
TP_sumproduct = 0;
TP_minsum = 0;
TP_likelihood = 0;

boxOffset = [-40 -200/3];
%sumproduct
for i=1:100
    unaryPots = likelihoods(i,:);
    maxstates = sumproduct(pairwisePots, unaryPots);
    torsoCenter = maxstates(6,:);
    detectbox = [torsoCenter + boxOffset 80 200];
    TP_sumproduct = TP_sumproduct+(boxoverlap(detectbox, GT(i,:))>0.5);
end


%minsum
for i=1:100
    unaryPots = likelihoods(i,:);
    maxstates = minsum(pairwisePots, unaryPots);
    torsoCenter = maxstates(6,:);
    detectbox = [torsoCenter + boxOffset 80 200];
    TP_minsum = TP_minsum+(boxoverlap(detectbox, GT(i,:))>0.5);
end


%likelihood
for i=1:100
    unaryPots = likelihoods(i,:);
    [l_y,l_x] = find(unaryPots{1,6}==max(max(unaryPots{1,6})));
    torsoCenter = [l_x l_y];
    detectbox = [torsoCenter + boxOffset 80 200];
    TP_likelihood = TP_likelihood+(boxoverlap(detectbox, GT(i,:))>0.5);
end


accuracy_sumproduct = TP_sumproduct/100;
fprintf('Accuracy of sumproduct: %f\n', accuracy_sumproduct);
accuracy_minsum = TP_minsum/100;
fprintf('Accuracy of minsum: %f\n', accuracy_minsum);
accuracy_likelihood = TP_likelihood/100;
fprintf('Accuracy of likelihood: %f\n', accuracy_likelihood);






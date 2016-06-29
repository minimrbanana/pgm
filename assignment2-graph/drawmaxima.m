function drawmaxima(imgidx, maxima, box1, box2)
% idx: index of the image
% maxima: 6x2 matrix of maxima
% box1, box2: optional arguments for drawing boxes

    figure;
    filename = sprintf('testset/%05.0f-height200.png',imgidx);
    im = imread(filename);
    imagesc(im); hold on;
     for i=1:2
         plot(maxima(i,1),maxima(i,2),'r*');
     end
     for i=3:4
         plot(maxima(i,1),maxima(i,2),'g*');
     end
    for i=5
        plot(maxima(i,1),maxima(i,2),'b*');
    end
    for i=6
        plot(maxima(i,1),maxima(i,2),'y*');
    end
    
    if nargin>2
        rectangle('Position', box1, 'EdgeColor','r');
    end
    if nargin>3
        rectangle('Position', box2, 'EdgeColor','g');
    end
    hold off;

end


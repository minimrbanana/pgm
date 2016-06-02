function im2video(seq_id)
% save image to video

v = VideoWriter(['seq' num2str(seq_id) '.avi']);
path = sprintf('results%d/',seq_id);
imdir = dir([path '*.png']);
open(v);
for i=1:size(imdir,1)
    im = imread([path imdir(i).name]);
    writeVideo(v,im);
end
close(v);
end
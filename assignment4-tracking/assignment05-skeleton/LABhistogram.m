%   Instructional material for COM-711 Selected Topics in Computer Vision
%   Autumn 2009
%
%   Assignment #5 - Particle filters & 2-D Tracking.
%
%   Copyright © 2009 Computer Vision Lab, 
%   École Polytechnique Fédérale de Lausanne (EPFL), Switzerland.
%   All rights reserved.
%
%   Author:    Kevin Smith         http://cvlab.epfl.ch/~ksmith/
%
%   This program is free software; you can redistribute it and/or modify it 
%   under the terms of the GNU General Public License version 2 (or higher) 
%   as published by the Free Software Foundation.
%                                                                     
%       This program is distributed WITHOUT ANY WARRANTY; without even the 
%   implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
%   PURPOSE.  See the GNU General Public License for more details.

%% LABhistogram(imagePatch) extracts an LAB-space histogram color
%% descriptor of an RGB imagePatch.
function h = LABhistogram(imagePatch)

% convert RGB to LAB space, and find the A & B channels
patchLAB = r2l(imagePatch);
A = patchLAB(:,:,2);
B = patchLAB(:,:,3);

% define the edges of the histogram bins
Abins = -5:1:20;
Bbins = -5:1:20;

% populate histograms for the A & B channels using binning defined by Abins
% & Bbins
Ahist = histc(A(:),Abins);
Bhist = histc(B(:),Bbins);

% concatenate the histograms into a single multi-channel histogram
h = [Ahist(:)' Bhist(:)'];

% normalize the histogram
h = h/sum(h);



function [K_R] = rotate_img(k,teta)
if length(size(k))>2
k = rgb2gray(k);
end 
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
K_R = imrotate(k,teta);
figure
imshow(K_R)
end


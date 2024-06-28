function [K_LP] = gussian_filter(k,var,w)
k=rgb2gray(k);
K_LP = imgaussfilt(k,var,'FilterSize',w);
figure
imshow(K_LP)
end


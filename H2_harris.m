function [L] = H2_harris(k,m)
img = k;
if length(size(img))>2
img = rgb2gray(img);
end 
%%applying sobel edge detector in the horizontal direction
fx=[-1 0 1];
Ix = filter2(fx,img);
% applying sobel edge detector in the vertical direction
fy=[-1;0;1];
Iy = filter2(fy,img); 
Ix2 = Ix.^2;
Iy2 = Iy.^2;
Ixy = Ix.*Iy;
clear Ix;
clear Iy;

height = size(img,1);
width = size(img,2);
L = zeros(height,width); 
R = zeros(height,width);
Rmax = 0; 
for i = 2:height-1
for j = 2:width-1
    M=zeros(2,2);
    M1=[];
    for p=-1:1
        for q=-1:1
M1 = [Ix2(i+p,j+q) Ixy(i+p,j+q);Ixy(i+p,j+q) Iy2(i+p,j+q)]; 
M=M1+M;
        end
    end
R(i,j) = det(M)-0.01*(trace(M))^2;
if R(i,j) > Rmax
Rmax = R(i,j);
end;
end;
end;

numcorner = 0;

for i = 2:height-1
for j = 2:width-1
    if numcorner < m
      if R(i,j) > 0.1*Rmax && R(i,j) > R(i-1,j-1) && R(i,j) > R(i-1,j) && R(i,j) > R(i-1,j+1) && R(i,j) > R(i,j-1) && R(i,j) > R(i,j+1) && R(i,j) > R(i+1,j-1) && R(i,j) > R(i+1,j) && R(i,j) > R(i+1,j+1)
      L(i,j) = 1;
      numcorner = numcorner+1;
      end;
    end;
end;
end;

[posc, posr] = find(L == 1);
numcorner;
imshow(img);
hold on;
plot(posr,posc,'r.');

end


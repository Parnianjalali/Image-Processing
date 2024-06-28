function [K_FFT,K_DCT,K_DWT] =LP1_4_FDCW(K)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if length(size(K))>2
K = rgb2gray(K);
end 
[m n]=size(K);
J=fft2(K);
J=fftshift(J);
F=zeros(size(J));
for i=1:m
    for j=1:n
        if(((i-m/2).^2)+((j-n/2).^2)).^0.5<((m.^2/(3*pi))).^0.5
        %if(((i-m/2).^2)+((j-n/2).^2)).^0.5<m/6
            F(i,j)=J(i,j);
        end
    end
end
imshow(ifft2(fftshift(F)),[]);
title('Filtered image with FFT');
K_FFT=uint8(ifft2(fftshift(F)));
%peaksnr = psnr(K_FFT,K);
%peaksnr
J=dct2(K);
F=zeros(size(J));
for i=1:m
    for j=1:n
        if(i+j)<200
        
            F(i,j)=J(i,j);
        end
    end
end
figure
imshow(uint8(idct2(F)),[]);
title('Filtered image with DCT');
K_DCT=uint8(idct2(F));
%peaksnr = psnr(K_DCT,K);
%peaksnr
[cA,cH,cV,cD] = dwt2(K,'db4');
 Z=zeros(size(cD));
    cD=Z;
    cH=Z;
    cV=Z;
   K_DWT=idwt2(cA,cH,cV,cD,'db4',size(K));
    
%figure
%imshow(cA)

end
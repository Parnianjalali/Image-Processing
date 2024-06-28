function [B,peaksnr]= edge_by_gradient(K,T,mode)
if length(size(K))>2
K = rgb2gray(K);
end 
[m n]=size(K);
if strcmp(mode,'FFT')
J=fft2(K);
J=fftshift(J);
F=zeros(size(J));
for i=1:m
    for j=1:n
        %if(((i-m/2).^2)+((j-n/2).^2)).^0.5<((m.^2/(3*pi))).^0.5
        if(((i-m/2).^2)+((j-n/2).^2)).^0.5<T
            F(i,j)=J(i,j);
        end
    end
end
%imshow(ifft2(fftshift(F)),[]);
%title('Filtered image');
K_FFT=uint8(ifft2(fftshift(F)));
peaksnr = psnr(K_FFT,K);

K_FFT=real(K_FFT);
[Gx,Gy] = imgradientxy(K_FFT);
E = sqrt(Gx.*Gx + Gy.*Gy);

edgeImage = uint8((E > 70) * 255);
im2bw(edgeImage);
figure
imshow(~edgeImage)
%title('Edges obtained with T=300')
B=edgeImage;
end

if strcmp(mode,'DCT')
J=dct2(K);
F=zeros(size(J));
for i=1:m
    for j=1:n
        %if(i+j)<sqrt((4*m.^2)/3*pi)
        if(i+j)<T
            F(i,j)=J(i,j);
        end
    end
end
%figure
%imshow(uint8(idct2(F)),[]);
%title('Filtered image2');
K_DCT=uint8(idct2(F));
%figure
%imshow(K_DCT)
%title('Filtered image2');
peaksnr = psnr(K_DCT,K);

[Gx,Gy] = imgradientxy(K_DCT);
E = sqrt(Gx.*Gx + Gy.*Gy);

edgeImage = uint8((E > 70) * 255);
edgeImage=im2bw(edgeImage);
%figure
%imshow(~edgeImage)
B=edgeImage;
%title('Edges obtained with T=300')
end
if strcmp(mode,'DWT')
    [cA,cH,cV,cD]=dwt2(K,'db4');
    Z=zeros(size(cD));
    cD=Z;
    cH=Z;
    cV=Z;
    B=idwt2(cA,cH,cV,cD,'db4',size(K));
    K=im2double(K);
    peaksnr = psnr(B,K);
end
    
end

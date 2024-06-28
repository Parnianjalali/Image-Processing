clear 
close all
K = imread('Hi.jpg');
%% HW2_1 Invoke function
[K_FFT,K_DCT,K_DWT]= LP1_4_FDCW(K);
K=rgb2gray(K);
p1 = psnr(K,K_FFT);
p2 = psnr(K,K_DCT);
K=im2doube(K);
p3 = psnr(K,K_DWT);
%% HW2_2 Invoke Function
T =  ;
[B,psnr_fft] = edge_by_gradient(K,T,'FFT');
[B,psnr_dct] = edge_by_gradient(K,T,'DCT');
[B,psnr_dwt] = edge_by_gradient(K,T,'DWT');
TH =  ;
[BW,THRESH] = edge(K,'canny',TH);
%% HW2_3 Invoke Function
m =  ; 
[L]=H2_harris(K,m); 
%% HW2_4 Invoke function
w =  ; 
sigma= ;
lbp_hist = LBP(K,w);
K_LP = gussian_filter(K,sigma,w);
lbp_hist_LP = LBP(K_LP,w);
teta=90;
K_R = rotate_img(k,teta);
lbp_hist_R = LBP(K_R,w);
%%
d1 = distance_function(lbp_hist,lbp_hist_LP,'Euclidean');
d2 = distance_function(lbp_hist,lbp_hist_LP,'City');
d3 = distance_function(lbp_hist,lbp_hist_LP,'Chess');

d1 = distance_function(lbp_hist,lbp_hist_R,'Euclidean');
d2 = distance_function(lbp_hist,lbp_hist_R,'City');
d3 = distance_function(lbp_hist,lbp_hist_R,'Chess');
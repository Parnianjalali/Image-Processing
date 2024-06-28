function [lbp_hist] = LBP(k,W)
if length(size(k))>2
k = rgb2gray(k);
end 
%lbp_hist = extractLBPFeatures(k,'Upright',false,'CellSize',[W W]);
lbp_hist = extractLBPFeatures(k,'CellSize',[W W]);
numCells = prod(floor(size(k)/W))
figure
%bar([lbpbarbara]','grouped')
%figure
bar([lbp_hist]','grouped')
end


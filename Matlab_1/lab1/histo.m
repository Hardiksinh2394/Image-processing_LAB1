function [r,k] = histo(I)
%%
% for the histogram 
% I = input any img ex; imread ('spine.tif')
% run the function ex: histo('spine.tif')
%
%%
t=1:256;
n=0:255;
[r,c]=size(I);
count=0;

for k=1:256
  for i=1:r
    for j=1:c
     if I(i,j)==k-1
        count=count+1; 
     end
    end
  end
   t(k)=count;
   count=0;
end
  
 stem(n,t)
end

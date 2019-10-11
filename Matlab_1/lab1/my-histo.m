function [h] = my-histo(I)

n=0:255;
[r,c]=size(I);
count=0;

for(z=1:256)
  for (i=1:r)
    for (j=1:c)
     if (  I(i,j)==z-1)
        count=count+1; 
     end;
   end;
  end;
  t(z)=count;
  stem(n,t(z));
  count=0;
  
end;



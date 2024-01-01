   [nind nvar]=size(remainingphenotypes);


for i=1:nvar
       
            remaininggeno{1,i} = d2b( (remainingphenotypes(:,i) - bounds(i,1) )/ ( bounds(i,2) - bounds(i,1) )*2^(nbits),nbits);
    
    end
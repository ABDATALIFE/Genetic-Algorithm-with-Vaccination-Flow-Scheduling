[nind nvar]=size(pheno);
for i=1:nvar
        phenonewtypes( : , i ) = b2d ( newgentypes {1, i} , nbits ) * ( bounds(i,2)- bounds(i,1) ) / 2^nbits + bounds(i,1);
end
 



 
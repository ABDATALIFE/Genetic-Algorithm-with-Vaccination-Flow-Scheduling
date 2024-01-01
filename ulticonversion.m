function [phenofinalfilter1,phenofinalfilter2,phenofinalfilter3] = ulticonversion(genoremainvacc1,genoremainvacc2,genoremainvacc3)

nbits =12;


[nind nvar]=size(genoremainvacc1);
for i=1:nvar
        phenofinalfilter1( : , i ) = b2d ( genoremainvacc1{1, i} , nbits ) * ( bounds(i,2)- bounds(i,1) ) / 2^nbits + bounds(i,1);
end



[nind2 nvar2]=size(genoremainvacc2);
for i=1:nvar2
        phenofinalfilter2( : , i ) = b2d ( genoremainvacc2{1, i} , nbits ) * ( bounds(i,2)- bounds(i,1) ) / 2^nbits + bounds(i,1);
end


[nind3 nvar3]=size(genoremainvacc3);
for i=1:nvar3
        phenofinalfilter3( : , i ) = b2d ( genoremainvacc3{1, i} , nbits ) * ( bounds(i,2)- bounds(i,1) ) / 2^nbits + bounds(i,1);
end
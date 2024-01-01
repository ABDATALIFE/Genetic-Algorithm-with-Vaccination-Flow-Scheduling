

[nind nvar] = size(newgenotype3);
for i=1:nvar
        phenonewtypes3( : , i ) = b2d ( newgenotype3 {1, i} , nbits ) * ( bounds(i,2)- bounds(i,1) ) / 2^nbits + bounds(i,1);
end
 
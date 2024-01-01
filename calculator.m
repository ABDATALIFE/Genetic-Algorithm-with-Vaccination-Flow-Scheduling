function [phenonewtypes] = calculator(newgenotype1,nbits)

[nind nvar] = size(newgenotype1);

for i=1:nvar
        phenonewtypes( : , i ) = b2d ( newgenotype1 {1, i} , nbits ) * ( bounds(i,2)- bounds(i,1) ) / 2^nbits + bounds(i,1);
end
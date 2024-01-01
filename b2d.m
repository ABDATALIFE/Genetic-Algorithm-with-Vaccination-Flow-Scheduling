function dec = b2d (bin,nbits)

dec = bin * (2.^((nbits-1):-1:0))';

end
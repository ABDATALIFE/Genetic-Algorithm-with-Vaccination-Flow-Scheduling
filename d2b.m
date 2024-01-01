function bin= d2b (dec,nbits)

bin= rem(floor( dec * 2.^(1-nbits:0)),2);

end
function [genoremainvacc1,genoremainvacc2,genoremainvacc3] = conversion(remainingphenotypes1,remainingphenotypes2,remainingphenotypes3)
    

    nbits =12;
    
    [nind nvar]=size(remainingphenotypes1);
    for i=1:nvar
        genoremainvacc1 {1,i} = d2b( (remainingphenotypes1(:,i) - bounds(i,1))/ ( bounds(i,2) - bounds(i,1)) * 2^(nbits) , nbits );
                                
           
    end
    
    
    
    [nind2 nvar2]=size(remainingphenotypes2);
    for i=1:nvar
        genoremainvacc2 {1,i} = d2b( (remainingphenotypes2(:,i) - bounds(i,1))/ ( bounds(i,2) - bounds(i,1)) * 2^(nbits) , nbits );
                           
       
    end
    
    
     [nind3 nvar3]=size(remainingphenotypes3);
    for i=1:nvar
        genoremainvacc3 {1,i} = d2b( (remainingphenotypes3(:,i) - bounds(i,1))/ ( bounds(i,2) - bounds(i,1)) * 2^(nbits) , nbits );
                           
       
    end
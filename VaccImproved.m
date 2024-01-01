function [newimprovedtype] = VaccImproved(remaininggeno)


[nind nvar]=size(remaininggeno);

for i = 1: nvar

    
    for m = 1:nind
        
                
        bit4 = remaininggeno{i}(m,4);
        bit7 = remaininggeno{i}(m,7);
        bit11 = remaininggeno{i}(m,11);
        
        
        if bit4 == 0
            remaininggeno{i}(m,4) = 1;
        elseif bit4 == 1 
            remaininggeno{i}(m,4) = 0;
        end
        
        if bit7 == 0
            remaininggeno{i}(m,7) = 1;
        elseif bit7 == 1 
            remaininggeno{i}(m,7) = 0;
        end

        if bit11 == 0
            remaininggeno{i}(m,11) = 1;
        elseif bit11 == 1 
            remaininggeno{i}(m,11) = 0;
        end
        
        

        
    end
    newimprovedtype = remaininggeno;

end
function abcd = vaccination(genonew)

for i = 1: 3

    
    for m = 1:250
        
                
        bit5 = genonew{i}(m,5);
        bit8 = genonew{i}(m,8);
        bit9 = genonew{i}(m,9);
        bit12 = genonew{i}(m,12);
        
        if bit5 == 0
            genonew{i}(m,5) = 1;
        elseif bit5 == 1 
            genonew{i}(m,5) = 0;
        end
        
        if bit8 == 0
            genonew{i}(m,8) = 1;
        elseif bit8 == 1 
            genonew{i}(m,8) = 0;
        end

        if bit9 == 0
            genonew{i}(m,9) = 1;
        elseif bit5 == 1 
            genonew{i}(m,9) = 0;
        end
        
        if bit12 == 0
            genonew{i}(m,12) = 1;
        elseif bit5 == 1 
            genonew{i}(m,12) = 0;
        end

        
    end
    

end

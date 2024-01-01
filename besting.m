s(1) = 0.2;
for m = 1:length(pocket)-1
    
    
    if m == 1
        s(m) = s(m) + 0.4*( (pocket(m,1) - 43)/100);
    elseif m > 1 
        disp('AFTAB');
        s(m) = s(m) + 0.4*( (pocket(m+1,1) - pocket(m,1) )/100);
    end
end



    
    

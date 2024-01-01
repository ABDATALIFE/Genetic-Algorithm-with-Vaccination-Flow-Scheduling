s2 = zeros(length(pocket),1);
s2(1) = 0.4;
for i = 1:length(pocket)-1
    
    if i == 1
        error = (pocket(i,2) - 48) / 100;
        s2(i) = 0.4 + 0.4*error;
        
    elseif i > 1
        error2 = pocket(i,1) - pocket(i-1,1);
        s2(i) = s2(i-1) + 0.4*error2;
       
    end
end

Sigma2Final = max(s2);

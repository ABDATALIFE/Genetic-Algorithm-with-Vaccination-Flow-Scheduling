s1 = zeros(length(pocket),1);
s1(1) = 0.2;
for i = 1:length(pocket)-1
    
    if i == 1
        error = (pocket(i,1) - 43) / 100;
        s1(i) = 0.2 + 0.4*error;
        
    elseif i > 1
        error2 = pocket(i,1) - pocket(i-1,1);
        s1(i) = s1(i-1) + 0.4*error2;
        
    end
end

Sigma1Final = max(s1);

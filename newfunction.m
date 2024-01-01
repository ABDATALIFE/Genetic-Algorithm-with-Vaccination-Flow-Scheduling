function z = newfunction(pocket)


for n = 1:length(pocket)
       alpha = 0.4;
        s1(1) =0.2; pocket(1,1) = 43;
    
    if i  == 1
        s1(n) = s1(n) + alpha* ( ( pocket(n,1) - pocket(1,1)  ) / 100);    
        
    s1(n+1) = s1(n) + alpha* ( ( pocket(n,1) - pocket(n+1,1)  ) / 100);    
     
end

    
    



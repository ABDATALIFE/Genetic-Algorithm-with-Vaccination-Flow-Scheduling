function [newgenotypes,popsize] = vaccination(genonew,popsize)

for i = 1: 3
    
    for m = 1:popsize/2
        
        
        bittochange1 = randi([1 32],1,1);
        bittochange2 = randi([1 32],1,1);
        bittochange3 = randi([1 32],1,1);
        bittochange4 = randi([1 32],1,1);
        bittochange5 = randi([1 32],1,1);
        bittochange6 = randi([1 32],1,1);
        
        
        bitnew1 = genonew{i}(m,bittochange1);
        bitnew2 = genonew{i}(m,bittochange2);
        bitnew3 = genonew{i}(m,bittochange3);
        bitnew4 = genonew{i}(m,bittochange4);
        bitnew5 = genonew{i}(m,bittochange5);
        bitnew6 = genonew{i}(m,bittochange6);
        
        if bitnew1 == 0
            genonew{i}(m,bittochange1)= 1;
        elseif bitnew1 == 1 
            genonew{i}(m,bittochange1)= 0;
        end
        
        
         if bitnew2 == 0
            genonew{i}(m,bittochange2)= 1;
        elseif bitnew2 == 1 
            genonew{i}(m,bittochange2)= 0;
         end
        
         if bitnew3 == 0
            genonew{i}(m,bittochange3)= 1;
        elseif bitnew3 == 1 
            genonew{i}(m,bittochange3)= 0;
         end
         
        
          if bitnew4 == 0
            genonew{i}(m,bittochange4)= 1;
        elseif bitnew4 == 1 
            genonew{i}(m,bittochange4)= 0;
          end
         
          
          if bitnew5 == 0
            genonew{i}(m,bittochange5)= 1;
        elseif bitnew5 == 1 
            genonew{i}(m,bittochange5)= 0;
          end
       
         
          if bitnew6 == 0
            genonew{i}(m,bittochange6)= 1;
        elseif bitnew6 == 1 
            genonew{i}(m,bittochange6)= 0;
         end

        
    end
    newgenotypes = genonew;

end

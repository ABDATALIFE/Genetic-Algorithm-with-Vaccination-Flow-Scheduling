
function [newvaccinatedphenotypes1,newvaccinatedphenotypes2,newvaccinatedphenotypes3] = Filtering1(phenonewtypes1)

%  newvaccinatedphenotypes1 = zeros(250,1);
% newvaccinatedphenotypes2 = zeros(250,1);
% newvaccinatedphenotypes3 = zeros(250,1);


vaccinatedpheno = phenonewtypes1(:,1);
lengthofloop = length(vaccinatedpheno)
for i = 1:lengthofloop 

if (vaccinatedpheno(i,1) >  43) && (vaccinatedpheno(i,1) < 45)
    
    newvaccinatedphenotypes1(i,1) = vaccinatedpheno(i,1);
    
else 
    remainingphenotypes1(i,1) = vaccinatedpheno(i,1);
end
end
newvaccinatedphenotypes1 = nonzeros(newvaccinatedphenotypes1);
remainingphenotypes1 = nonzeros(remainingphenotypes1);

vaccinatedpheno2 = phenonewtypes1(:,2);

for i = 1:lengthofloop   

if (vaccinatedpheno2(i,1) >  46) && (vaccinatedpheno2(i,1) < 48)
    
    newvaccinatedphenotypes2(i,1) = vaccinatedpheno2(i,1);
    
else 
    remainingphenotypes2(i,1) = vaccinatedpheno2(i,1);
end

end
newvaccinatedphenotypes2 = nonzeros(newvaccinatedphenotypes2);
remainingphenotypes2 = nonzeros(remainingphenotypes2);

vaccinatedpheno3 = phenonewtypes1(:,3);

for i = 1:lengthofloop   

if (vaccinatedpheno3(i,1) >  48) && (vaccinatedpheno3(i,1) < 50)
   
    newvaccinatedphenotypes3(i,1) = vaccinatedpheno3(i,1);
    
else 
    remainingphenotypes3(i,1) = vaccinatedpheno3(i,1);
end

end
newvaccinatedphenotypes3 = nonzeros(newvaccinatedphenotypes3);
remainingphenotypes3 = nonzeros(remainingphenotypes3);
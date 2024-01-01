    
clc; % clear command window
clear all; % clear all variables in workspace
close all; % close all figures
popsize= 500 % population size
nvar=3;
bounds=[43 53;46 56;48 58];
alpha = 0.1;
%f = @ (y) - (500*y - 2*y.^2);
s1 = 0.2;
s2 = 0.4;
s3 = 0.4;

f = @(T1,T2,T3) + (s1*T1 + s1*T2 + s1*T3);

nbits=12;
mut_per = 3 ;
nmut = mut_per/100 * nvar * nbits * popsize;
ngen = 500;
pocket = zeros(ngen,nvar);
pocketnew = zeros(ngen,nvar);


tic
                %%%% Population Generation %%%%
% ************************************************************************
    pop = zeros(popsize,nvar); % intial buffer for increasing processing speed because of zeros                                

    for i=1:nvar    
        pop(:,i)= (bounds(i,2)- bounds (i,1)) * rand(popsize,1) + bounds(i,1); % (max-min)rand + min
    end
% *************************************************************************
pheno2 = zeros(popsize,ngen);
for k=1:ngen
 
                %%% Cost Function %%%%
% *************************************************************************
    str = [];
    cost=zeros(size(pop,1),1);
    for i=1:size(pop,2) 
        str = strcat(str,'pop(:,', num2str(i),'),' ); 
    end 
    
    str(length(str)) = [];
    eval(strcat('cost=feval(f,',str,');')); 
% *************************************************************************


                     %%%% Natural Selection %%%%
% *************************************************************************
    [val index] = sort(cost,'ascend') ;
    [val2 index2] = sort(cost,'descend') ;
    pheno2 = pop(index2(1:popsize/2),:);
                        % sorting the population according to the cost in ascending order
    pheno = pop(index(1:popsize/2),:);
    
    
% *************************************************************************
    pocketnew(k,:) = pheno2(1,:);
    pocket(k,:) = pheno(1,:);

                %%%% Pheno to Geno %%%%
% *************************************************************************
    [nind nvar]=size(pheno);
    for i=1:nvar
        geno {1,i} = d2b( (pheno(:,i) - bounds(i,1))/ ( bounds(i,2) - bounds(i,1)) * 2^(nbits) , nbits );
                            % geno is the cell 
    
        genonew{1,i} = d2b( (pheno2(:,i) - bounds(i,1) )/ ( bounds(i,2) - bounds(i,1) )*2^(nbits),nbits);
    
    end

  % *************************************************************************
    %%Vaccination Function
    
    
    
    
  
  
  
  
  
  
                %%%% Crossover %%%%
% *************************************************************************
nloop = 2*ceil(popsize/2);
nbits= size(geno{1,1},2);
nind = size(geno{1,1},1);

 for i=1:nvar
     for j = 1 : nloop/4
          
          row1 = round(1+ rand*(nind-1));
          row2 = round(1+ rand*(nind-1));
          
          col = round (1 +  rand*(nbits - 2));
            
          offsprings{1,i}(2*j-1,:) = [ geno{1,i}(row1,1:col) geno{1,i}(row2,(col+1):nbits)];  
          offsprings{1,i}(2*j,:) = [ geno{1,i}(row2,1:col) geno{1,i}(row1,(col+1):nbits)] ;
                  
     end
 end
% *************************************************************************



                    %%%% New Generation %%%%
% *************************************************************************
    nvar = size(geno,2);
    for i=1:nvar
        g{1,i}=[geno{1,i};offsprings{1,i}];
    end
    geno=g;
    
% *************************************************************************


                    %%%% Mutation %%%%
% *************************************************************************
mutants=g;
    for i = 1:nmut    
    
        var = round(1 + rand*(size(g,2)-1));
        ind = round(1 + rand*(size(g{1,var},1)-1));
        bit = round(1 + rand*(size(g{1,var},2)-1));
        mutants{1,var}(ind,bit) = 1 - mutants{1,var}(ind,bit);

    end
% *************************************************************************

                    %%%% Geno to Pheno %%%%
% *************************************************************************
  pheno = zeros(size(geno{1,1},1),nvar);
 
 for i=1:nvar
        pheno( : , i ) = b2d ( geno {1, i} , nbits ) * ( bounds(i,2)- bounds(i,1) ) / 2^nbits + bounds(i,1);
 end
% *************************************************************************
    pop = pheno;
end

newgenotype1 = vaccination(genonew,popsize);
newphenotypecalculation;
Filtering

genoremainvacc1 {1,1} = d2b( (newvaccinatedphenotypes1(:,1) - bounds(1,1))/ ( bounds(1,2) - bounds(1,1)) * 2^(nbits) , nbits );
genoremainvacc2 {1,1} = d2b( (newvaccinatedphenotypes2(:,1) - bounds(1,1))/ ( bounds(2,2) - bounds(2,1)) * 2^(nbits) , nbits );
genoremainvacc3 {1,1} = d2b( (newvaccinatedphenotypes3(:,1) - bounds(1,1))/ ( bounds(3,2) - bounds(3,1)) * 2^(nbits) , nbits );


lastgeno1 = VaccImproved(genoremainvacc1);
lastgeno2 = VaccImproved(genoremainvacc2);
lastgeno3 = VaccImproved(genoremainvacc3);

phenofinalfilter1= b2d ( lastgeno1 {1, 1} , nbits ) * ( bounds(1,2)- bounds(1,1) ) / 2^nbits + bounds(1,1);
phenofinalfilter2= b2d ( lastgeno2 {1, 1} , nbits ) * ( bounds(2,2)- bounds(2,1) ) / 2^nbits + bounds(2,1);
phenofinalfilter3= b2d ( lastgeno3 {1, 1} , nbits ) * ( bounds(3,2)- bounds(3,1) ) / 2^nbits + bounds(3,1);


process1 = [pocket(:,1)];
process2 = [pocket(:,2)];
process3 = [pocket(:,3)];

x1 = 1:size(process1);
x2 = 1:size(process2);
x3 = 1:size(process3);


figure
plot(x1,process1)
figure
plot(x2,process2)
figure
plot(x3,process3)



format long;
disp('**********************************************************************')
disp('Best Individual in Each Generation:'),
pocket

                %%% Cost Function %%%%
% *************************************************************************
    str = [];
    cost=zeros(size(pocket,1),1);
    for i=1:size(pocket,2) 
        str = strcat(str,'pocket(:,', num2str(i),'),' ); 
    end 
    str(length(str)) = [];
    eval(strcat('cost=feval(f,',str,');')); 
% *************************************************************************


                     %%%% Natural Selection %%%%
% *************************************************************************
    [val index] = sort(cost,'ascend') ; % sorting the population according to the cost in ascending order
    phe = pocket(index(1:(size(pocket))),:);
    best_pocket = phe(1,:);    
% *************************************************************************


 disp('**********************************************************************')
 disp('Best Individual in All Generations:')
 y = best_pocket
 
 other = [19 22 21];
 
 timings = [6 24 6 4 3;7 24 6 4 5;6 27 7 5 3];
 
 y(1) = round(y(1));
 y(2) = round(y(2));
 y(3) = round(y(3));
 
 
 
 
 for i = 1:size(y,2)
 updation(y(i),other,timings,i)
 
 
 
 end
 toc
 %x = 500 - 2 * ( best_pocket)
%Area = x*y
 



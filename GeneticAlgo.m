
clc; % clear command window
clear all; % clear all variables in workspace
close all; % close all figures
popsize=input('Enter Number of Populations');% population size
nvar=3;
bounds=[43 53;46 56;48 58];
alpha = 0.4;
%f = @ (y) - (500*y - 2*y.^2);
s1 = 0.25;
s2 = 0.35;
s3 = 0.40;

f = @(T1,T2,T3) + (s1*T1 + s1*T2 + s1*T3);

nbits=32;
mut_per = 3 ;
nmut = mut_per/100 * nvar * nbits * popsize;
ngen = input ('Enter Number of Generations');
pocket = zeros(ngen,nvar);



tic
                %%%% Population Generation %%%%
% ************************************************************************
    pop = zeros(popsize,nvar); % intial buffer for increasing processing speed because of zeros                                

    for i=1:nvar    
        pop(:,i)= (bounds(i,2)- bounds (i,1)) * rand(popsize,1) + bounds(i,1); % (max-min)rand + min
    end
% *************************************************************************
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
    [val index] = sort(cost,'ascend') ; % sorting the population according to the cost in ascending order
    pheno = pop(index(1:popsize/2),:);
    % *************************************************************************

    pocket(k,:) = pheno(1,:);

                %%%% Pheno to Geno %%%%
% *************************************************************************
    [nind nvar]=size(pheno);
    for i=1:nvar
        geno {1,i} = d2b( (pheno(:,i) - bounds(i,1))/ ( bounds(i,2) - bounds(i,1)) * 2^(nbits) , nbits ); % geno is the cell 
    end

  % *************************************************************************

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
    geno=mutants;
    
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
 figure
 plot(val);

    phe = pocket(index(1:(size(pocket))),:);
    best_pocket = phe(1,:);    
% *************************************************************************


 disp('**********************************************************************')
 disp('Best Individual in All Generations:')
 y = best_pocket
 
 other = [19 22 21];
 
 timings = [6 24 6 4 3;7 24 6 4 5;6 27 7 5 3];
 
 optimSigma;
 optimsignma2;
 OptimSigma3;
 
 
 
 %subplot(2,3,1)
 figure
 plot(1:length(pocket(:,1)),pocket(:,1))
 xlabel('Iterations')   
 ylabel('Process1')
 
 
 figure
 plot(1:length(pocket(:,2)),pocket(:,2))
 xlabel('Iterations')   
 ylabel('Process2')

 
 figure
 plot(1:length(pocket(:,3)),pocket(:,3))
 xlabel('Iterations')   
 ylabel('Process3')
 
 
 
 
 figure
 plot(1:length(s1(1:499)),s1(1:499))
 xlabel('Iterations')   
 ylabel('Sigma One')
 
 figure
 plot(1:length(s2(1:499)),s2(1:499))
 xlabel('Iterations')   
 ylabel('Sigma Two')
 
 
%   figure
%  plot(1,s3)
%  xlabel('Iterations')   
%  ylabel('Sigma Three')
 
 
 y(1) = round(y(1));
 y(2) = round(y(2));
 y(3) = round(y(3));
 
 
 
 
 for i = 1:size(y,2)
 updation(y(i),other,timings,i)
 
 
 
 end
 toc
 %x = 500 - 2 * ( best_pocket)
%Area = x*y
 



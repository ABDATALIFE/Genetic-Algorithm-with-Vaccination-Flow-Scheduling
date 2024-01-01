
function [P]= McNaughton (numberOfProcessors,durationOfJobs)
%function that calculate the schedulation sequence of fixed number of jobs
%on any number of machines
%McNaughton’s algorithm solves problem (numberOfProcessors,durationOfJobs), where a set of independent 
%jobs has to be scheduled on identical processors in order to minimize schedule 
%length. This algorithm consider preemption of the job and the resulting schedule is optimal. 
%The maximum length of task schedule is Makespan that can be defined as maximum of this 
%two values: max (averageDurationOnProcessors ,moreLongJob).

%calculation of Makespan

averageDurationOnProcessors = sum (durationOfJobs)/numberOfProcessors;
moreLongJob = max (durationOfJobs);
Makespan = max (averageDurationOnProcessors ,moreLongJob);
numberOfJobs =length(durationOfJobs);

%create a matrix where every elements is zero, in which the programme writes
%the duration of jobs processed by that processor.

P = zeros (numberOfProcessors,numberOfJobs);
    
k=1;
surplusTime=0;
%at first run the matrix
for i=1:numberOfProcessors
    j=1;
    ssum=0;
    
   %while j or k is less or equal numberOfJobs and the surplus Time is
   %different of zero 
    while j <= numberOfJobs && k <= numberOfJobs
        %if the surplus time is equal zero change sum with the duration of
        %jobs processed on that processor
       
        if surplusTime==0
            a = durationOfJobs(k);
            ssum = ssum + a;
            %if ssum is less than makespan, the program insert the duration
            %of job in the position (i,j) of matrix
            if ssum <= Makespan
                P(i,j)= a; 
                k=k+1;
                j=j+1;
                
                                
                %else the processor works for the residual time and it
                %calculate the surplus time of the last job
             else
                surplusTime = ssum - Makespan;
                workedTimeOfJobOnProcessor = durationOfJobs(k)- surplusTime;
                P(i,j) = workedTimeOfJobOnProcessor;
                j=numberOfJobs+1;
            end
        % insert the surplus time in one new machine and restart the
        % procedure
        else
            P(i,j) = surplusTime;
            k=k+1;
            j=j+1;
            ssum = surplusTime;
            surplusTime = 0;
            
        end
    end
end
%this show the Gant of our matrix
figure(); 
barh(P,'stack');
title 'McNaughton'
xlabel('Duration Of Jobs')
ylabel('Processors')
    


Job1Duration = [6 24 6 4 3];
Job2Duration = [7 26 6 4 5];
Job3Duration = [6 27 7 5 3];
Machine1Time = 0;
Machine2Time = 0;
Machine3Time = 0;


A = input('Enter Number of Jobs 1: ')
B = input('Enter Number of Jobs 2 ')
C = input('Enter Number of Jobs 3 ')

for i = 1:1
    
    TotalTime = Job1Duration(1) + A*Job1Duration(2) + B*Job2Duration(2) + C*Job3Duration(2) + Job3Duration(3) + Job3Duration(4) + Job3Duration(5)
    
    
%     TotalTimeForMachine1when2isReady = Job1Duration(1) + Job1Duration(2);
%     
%     NewTimeWhen3isReady = TotalTimeForMachine1when2isReady + Job2Duration(2);
%     
%     TimetocompleteJob3 = NewTimeWhen3isReady + Job3Duration(2) + Job3Duration(3) + Job3Duration(4) + Job3Duration(5);
    
    
    
end

    
    
    
    
    
    


processval = [[6 24 6 4 3;7 26 6 4 5;6 27 7 5 3]]; 
processingTime = [[6 24 6 4 3;7 26 6 4 5;6 27 7 5 3]];
optimalSchedule = zeros(3,5);
ptime = optimalSchedule;
numberOfProcessors = 5
for i = 1:numberOfProcessors
    schedi = find(processval(i,:));
    optimalSchedule(i,1:length(schedi)) = schedi;
    ptime(i,1:length(schedi)) = processingTime(i,schedi);
end
optimalSchedule
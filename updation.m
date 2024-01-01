function z  = updation(a,other,timings,i)

if a > other 
    timings(i,2) = round(a) - other(i);
    exact = timings(i,:)
end

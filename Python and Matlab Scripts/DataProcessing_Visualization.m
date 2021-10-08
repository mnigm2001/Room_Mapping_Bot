%Mohamed Negm
%400267484
%Description: This code process measured data from the xyz file and graphs
%               it on an xyz graph

f2=load('C:\Users\nonan\Desktop\2dx4_dsA0-1 Python Code\projectfile2dx4.xyz');

angleNum = 16;                  %Number of measurements per slice
sliceNums = 2;                  %Number of slices

%Variables for processing the data
f2Init = 1;
nvInit = 1;
f2Range = angleNum;
nVRange = angleNum;
newVec= zeros(angleNum*sliceNums + sliceNums, 3);       %New vector for processing

for i=1:sliceNums
    %Append the first slice into the new array
    newVec(nvInit:nVRange,1) = f2(f2Init:f2Range,1);
    newVec(nvInit:nVRange,2) = f2(f2Init:f2Range,2);
    newVec(nvInit:nVRange,3) = f2(f2Init:f2Range,3);
    
    %Append first value of slice into the end
    newVec(nVRange+1,1) = f2(f2Init,1);
    newVec(nVRange+1,2) = f2(f2Init,2);
    newVec(nVRange+1,3) = f2(f2Init,3);
    
    %Reset values for next slice
    nvInit = nVRange + 2;
    nVRange = nVRange + angleNum+1;
    f2Init = f2Init + angleNum;
    f2Range = f2Range + angleNum;
end
%Display the new vector for confirmation
disp(newVec)

%Split the x, y, z measurements
x = newVec(:,1)*100;
y = newVec(:,2);
z = newVec(:,3);

%Plot the data and set the axis
plot3(y,x,z);
xlabel('y(mm)');
ylabel('x(mm)');
zlabel('z(mm)');
grid on
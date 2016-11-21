clc

windowSize = 10;
b = (1/windowSize)*ones(1,windowSize);
a = 1;
p={};qrs={};t={};tp={};tqrs={};tt={};
load('Pavg.mat');
s=[18 18 7 11 8 6 6];

for j=1:23
    if(j==2||j==10||j==11||j==14)continue;end
    x=strcat(strcat('af(',int2str(j)),')')
    plot(7+j,correlate(P,x,'af'),'xr')
    hold on
end
for j=1:7
    
    y=strcat('person_',int2str(j))
for i=1:s(j)
    x=strcat('rec_',int2str(i))
plot(j,correlate(P,x,y),'ob');
hold on
p{i}=P;qrs{i}=QRS;t{i}=T;
end
end
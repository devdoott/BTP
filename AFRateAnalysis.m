clc

windowSize = 10;
b = (1/windowSize)*ones(1,windowSize);
a = 1;
p={};qrs={};t={};tp={};tqrs={};tt={};
%load('Pavg.mat');
%s=[18 18 7 11 8 6 6];
s=[20 22 7 11 8 6 6];
h=[];
M=zeros(3,3);tot=0;tot=0;RRAF=[];DKLAF=[];EAF=[];
for j=1:23
    if(j==14)continue;end
    x=strcat(strcat('af(',int2str(j)),')')
    y='af';
    M=probMat(x,y)
    RRAF=[RRAF;M(2,2)];
    [D E]=HRSimilarity(x,y);
    DKLAF=[DKLAF;D];
    EAF=[EAF;E];
    tot=tot+1;
%h=[h;[j correlate(P,x,y)]];

%hold on
%p{i}=P;qrs{i}=QRS;t{i}=T;
end

M=M./tot

folder='HRVAnalysis\';
%save(strcat(folder,'AFprobMat.mat'),'M');

save(strcat(folder,'AFFeatures.mat'),'RRAF','EAF','DKLAF');

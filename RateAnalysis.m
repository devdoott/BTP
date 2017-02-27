clc

windowSize = 10;
b = (1/windowSize)*ones(1,windowSize);
a = 1;
p={};qrs={};t={};tp={};tqrs={};tt={};
%load('Pavg.mat');
%s=[18 18 7 11 8 6 6];
s=[20 22 7 11 8 6 6];
h=[];
M=zeros(3,3);tot=0;RRNorm=[];DKLNorm=[];ENorm=[];
for j=1:7
    
    y=strcat('person_',int2str(j))
for i=1:s(j)
    x=strcat('rec_',int2str(i))
    M=M+probMat(x,y);
    %RRNorm=[RRNorm;M(2,2)];
    %[D E]=HRSimilarity(x,y);
    %DKLNorm=[DKLNorm;D];
    %ENorm=[ENorm;E];
    tot=tot+1;
%h=[h;[j correlate(P,x,y)]];

%hold on
%p{i}=P;qrs{i}=QRS;t{i}=T;
end
end
M=M./tot

folder='..\af\HRVAnalysis\';
%save(strcat(folder,'NormalprobMat.mat'),'M');

%save(strcat(folder,'NormalFeatures.mat'),'RRNorm','ENorm','DKLNorm');
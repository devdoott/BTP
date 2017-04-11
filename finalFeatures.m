clc

windowSize = 10;
b = (1/windowSize)*ones(1,windowSize);
a = 1;
p={};qrs={};t={};tp={};tqrs={};tt={};
%load('Pavg.mat');
%s=[18 18 7 11 8 6 6];
s=[20 22 7 11 8 6 6];
h=[];
M=zeros(3,3);tot=0;tot=0;
load('Pavg.mat');
RRAF=[];DKLAF=[];EAF=[];h=[];
EntropyNorm=[];esmoothNorm=[];stempNorm=[];stempsNorm=[];typ=[];
final=[];
for j=14:14
    RRAF=[];DKLAF=[];EAF=[];h=[];
    EntropyNorm=[];esmoothNorm=[];stempNorm=[];stempsNorm=[];typ=[];
    if(j==14)continue;end
    x=strcat(strcat('af(',int2str(j)),')')
    y='af';
    M=probMat(x,y);
    RRAF=[RRAF;M(2,2)];
    h=[h;correlate(P,x,'af')];
   [Entropy,esmooth,stemp,stemps]=spect(x,y);
    EntropyNorm=[EntropyNorm;Entropy];
   esmoothNorm=[esmoothNorm;esmooth];
   stempNorm=[stempNorm;stemp];
   stempsNorm=[stempsNorm;stemps];
    [D E]=HRSimilarity(x,y);
    DKLAF=[DKLAF;D];
    EAF=[EAF;E];
    typ=[typ;1];
    tot=tot+1;
    input=[DKLAF';EAF';EntropyNorm';RRAF';h';stempNorm'];
    final=[final;finalProbability(input)];
%h=[h;[j correlate(P,x,y)]];

%hold on
%p{i}=P;qrs{i}=QRS;t{i}=T;
end
for j=1:1
    
RRAF=[];DKLAF=[];EAF=[];h=[];
EntropyNorm=[];esmoothNorm=[];stempNorm=[];stempsNorm=[];typ=[];
    y=strcat('person_',int2str(j))
for i=1:1
    
RRAF=[];DKLAF=[];EAF=[];h=[];
EntropyNorm=[];esmoothNorm=[];stempNorm=[];stempsNorm=[];typ=[];
    x=strcat('rec_',int2str(i))
   [Entropy,esmooth,stemp,stemps]=spect(x,y);
   EntropyNorm=[EntropyNorm;Entropy];
   esmoothNorm=[esmoothNorm;esmooth];
   stempNorm=[stempNorm;stemp];
   stempsNorm=[stempsNorm;stemps];
   
    h=[h;correlate(P,x,y)];
    M=probMat(x,y);
    RRAF=[RRAF;M(2,2)];
        [D E]=HRSimilarity(x,y);
    DKLAF=[DKLAF;D];
    EAF=[EAF;E];
    typ=[typ;0];
    %if(j==1)ttSmooth=amp
    %else ttSmooth=ttSmooth+amp;
  % end
   % length(f)
   % length(amp)
   %figure(j) 
   %plot(f,amp)
    %hold on
    [output input]=processing(x,y)
    %input=[DKLAF';EAF';EntropyNorm';RRAF';h';stempNorm']
    %final=[final;finalProbability(input)];
end

end
%M=M./tot
%plot(final);
%folder='';
%save(strcat(folder,'AFprobMat.mat'),'M');

%save(strcat(folder,'FinalFeatures.mat'),'RRAF','EAF','DKLAF','EntropyNorm','esmoothNorm','stempNorm','stempsNorm','h','typ');

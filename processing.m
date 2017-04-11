function[output,features,ecgPlot]=processing(x,y)
curdir = pwd;
x;
[~,config]=wfdbloadlib;
eval(['cd ' config.WFDB_JAVA_HOME filesep y])
[t,sig] = rdsamp(x,[],5000); % for 20000 samples
sqrs(x); %create qrs annotation file first
ecgpuwave(x,'test',[],[],'qrs');
pwave = rdann(x,'test',[],5000,[],'p'); %P-peaks
twave = rdann(x,'test',[],5000,[],'t'); % T-peaks
swave = rdann(x,'test',[],5000,[],'('); %starts
ewave = rdann(x,'test',[],5000,[],')'); %ends
qrswave = rdann(x,'test',[],5000,[],'N'); %r peaks
%subswave=swave>=1000;subswave=swave(subswave)<=5000;
windowSize = 10;
%pwave=pwave+5;
%qrswave=qrswave+5;
%twave=twave+5;
%swave=swave+5;
%ewave=ewave+5;
load('Pavg.mat');


b = (1/windowSize)*ones(1,windowSize);
a = 1;
%sig(:,1)=filter(b,a,sig(:,1));
pw={};m=0;j=1;
%k=convhull(t,sig(:,1));
%plot(t(k),sig(k,1));
sig(:,1)=smooth(sig(:,1));
%figure(25)
%plot(t,sig(:,1));


finalplot=plot(t,sig(:,1),'-b',t(swave),sig(swave,1),'og',t(ewave),sig(ewave,1),'og',t(qrswave),sig(qrswave,1),'or',t(pwave),sig(pwave,1),'or',t(twave),sig(twave,1),'or');
grid on;
set(finalplot(2:3),'MarkerEdgeColor','none','MarkerFaceColor','g')
set(finalplot(4:6),'MarkerEdgeColor','none','MarkerFaceColor','r')

ecgPlot=finalplot;
%plot(t(ewave),sig(ewave,1),'og');
%plot(t(qrswave),sig(qrswave,1),'or');
%plot(t(pwave),sig(pwave,1),'or');
%plot(t(twave),sig(twave,1),'or');
%hold off
h=[];
M=zeros(3,3);tot=0;tot=0;
%RRAF;DKLAF;EAF;h;
%EntropyNorm;esmoothNorm;stempNorm;stempsNorm;
%RRAF=[];DKLAF=[];EAF=[];h=[];
%EntropyNorm=[];esmoothNorm=[];stempNorm=[];stempsNorm=[];typ=[];
M=probMat(x,y);
RRAF=M(2,2);
h=correlate(P,x,y);
[Entropy,esmooth,stemp,stemps]=spect(x,y);
EntropyNorm=Entropy;
esmoothNorm=esmooth;
stempNorm=stemp;
stempsNorm=stemps;
[D E]=HRSimilarity(x,y);
DKLAF=D;
EAF=E;
features=[DKLAF';EAF';EntropyNorm';RRAF';h';stempNorm'];
prob=finalProbability(features);
if(prob<=0)prob=0;
elseif(prob>=1)prob=1;
end
output=prob;
%h=[h;[j correlate(P,x,y)]];

%hold on
%p{i}=P;qrs{i}=QRS;t{i}=T;

%M=M./tot
%save(strcat(folder,'AFprobMat.mat'),'M');

%save(strcat(folder,'FinalFeatures.mat'),'RRAF','EAF','DKLAF','EntropyNorm','esmoothNorm','stempNorm','stempsNorm','h','typ');

end
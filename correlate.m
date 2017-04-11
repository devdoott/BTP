function R=correlate(P,x,y)
curdir = pwd;
%x='rec_1';
[~,config]=wfdbloadlib;
eval(['cd ' config.WFDB_JAVA_HOME filesep y])
[t,sig] = rdsamp(x,[],6000); % for 20000 samples
%sqrs(x); %create qrs annotation file first
%ecgpuwave(x,'test',[],[],'qrs');
pwave = rdann(x,'test',[],6000,[],'p'); %P-peaks
%twave = rdann(x,'test',[],5000,[],'t'); % T-peaks
swave = rdann(x,'test',[],6000,[],'('); %starts
ewave = rdann(x,'test',[],6000,[],')'); %ends

qrswave = rdann(x,'test',[],6000,[],'N'); %r peaks
windowSize = 10;
b = (1/windowSize)*ones(1,windowSize);
a = 1;
%sig(:,1)=filter(b,a,sig(:,1));
sig(:,1)=smooth(sig(:,1));
%load('Pavg.mat');
P=transpose(P);
tt=1;

corr=[];l=[];j=1;
k=1;
for i=2:length(swave)-1
 %  length( pwave)
if(tt<=length(pwave)&&swave(i)<pwave(tt))
    k=i;
elseif(tt>length(pwave))break;
else
    
pw{j}=sig(swave(k):ewave(k),1);
j=j+1;
l=[l;length(swave(k):ewave(k))];
tt=tt+1;
end
end
%for i=k:3:length(ewave)
    
%pw{j}=sig(swave(i):ewave(i),1);
%j=j+1;
%l=[l;length(swave(i):ewave(i))];

%corr=[corr;corrcoef()]
%if(m<l)m=l;
%end
%end
%length(P)

%l
for i=1:length(l)
    %l(i)
        if(l(i)==0)
        corr=[corr; 0];
        continue;
    end
 %   x=min([l(i);length(P)]);
    
    c=corrcoef(pw{i},P(1:l(i)));
        corr=[corr;c(2,1)];
    
    
        
end
cc=max(corr);
ncb=length(qrswave);
n=length(corr((cc-corr)>=0.2))+ncb-length(corr);

R=n/ncb;

end
%length(P)

%corr
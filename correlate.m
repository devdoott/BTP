function R=correlate(P,x,y)
curdir = pwd;
%x='rec_1';
[~,config]=wfdbloadlib;
eval(['cd ' config.WFDB_JAVA_HOME filesep y])
[t,sig] = rdsamp(x,[],6000); % for 20000 samples
sqrs(x); %create qrs annotation file first
ecgpuwave(x,'test',[],[],'qrs');
pwave = rdann(x,'test',[],5000,[],'p'); %P-peaks
%twave = rdann(x,'test',[],5000,[],'t'); % T-peaks
swave = rdann(x,'test',[],5000,[],'('); %starts
ewave = rdann(x,'test',[],5000,[],')'); %ends
sig(:,1)=smooth(sig(:,1));
k=1;
%load('Pavg.mat');
P=transpose(P);
for i=2:length(swave)
if(swave(i)<pwave(1))
    k=i;
else
    break;
end
end
corr=[];l=[];j=1;
for i=k:3:length(ewave)
    
pw{j}=sig(swave(i):ewave(i),1);
j=j+1;
l=[l;length(swave(i):ewave(i))];

%corr=[corr;corrcoef()]
%if(m<l)m=l;
%end
end
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
n=length(corr(corr>=0.2));
R=n/length(corr)
end
%length(P)

%corr
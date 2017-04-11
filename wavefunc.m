%for a file name 'rec_3' have its all 3 files .dat,.hea,.atr
function [P QRS T]=wavefunc(x,y)
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


b = (1/windowSize)*ones(1,windowSize);
a = 1;
sig(:,1)=filter(b,a,sig(:,1));
pw={};m=0;j=1;
%k=convhull(t,sig(:,1));
%plot(t(k),sig(k,1));
sig(:,1)=smooth(sig(:,1));
%figure(25)
%plot(t,sig(:,1));

%grid on
%hold on
%h=plot(t(swave),sig(swave,1),'og',t(ewave),sig(ewave,1),'og',t(qrswave),sig(qrswave,1),'or',t(pwave),sig(pwave,1),'or',t(twave),sig(twave,1),'or');
%set(h(1:2),'MarkerEdgeColor','none','MarkerFaceColor','g')
%set(h(3:5),'MarkerEdgeColor','none','MarkerFaceColor','r')
%plot(t(ewave),sig(ewave,1),'og');
%plot(t(qrswave),sig(qrswave,1),'or');
%plot(t(pwave),sig(pwave,1),'or');
%plot(t(twave),sig(twave,1),'or');
%hold off
windowSize = 10;
b = (1/windowSize)*ones(1,windowSize);
a = 1;
%sig(:,1)=filter(b,a,sig(:,1));
%/norm(sig(:,1));
%plot(t,sig(:,1));
k=1;
for i=2:length(swave)
if(swave(i)<pwave(1))
    k=i;
else
    break;
end
end
for i=k:3:length(ewave)
    
pw{j}=transpose(sig(swave(i):ewave(i),1));
j=j+1;
l=length(swave(i):ewave(i));
if(m<l)m=l;
end
end
%m=max(length(pw(:,:)));
P=[];
for i=1:j-1
    if(length(pw{i})<m)
        %size(pw{i});
        %m;
        %length(pw{i});
        %size(zeros(1,m-length(pw{i})));
        pw{i}=horzcat(pw{i},zeros(1,m-length(pw{i})));
    end
    
        P=[P;pw{i}];
end
P=mean(P);
P=P(P~=0);
if(length(P)==0)P=[0];
end
low=min(P(:));
high=max(P(:));
%if(low>0)
P=P-low;
P=P/(high-low);
P=filter(b,a,P);
P=smooth(P);
%M=smooth(M);
%plot(M(:));
pw={};m=0;j=1;
%k=convhull(t,sig(:,1));
%plot(t(k),sig(k,1));
windowSize = 10;
b = (1/windowSize)*ones(1,windowSize);
a = 1;
%sig(:,1)=filter(b,a,sig(:,1));
%sig(:,1)=smooth(sig(:,1));%/norm(sig(:,1));
%plot(t,sig(:,1));
k=1;
for i=2:length(swave)
if(swave(i)<qrswave(1))
    k=i;
else
    break;
end
end
%k
for i=k:3:length(ewave)
    
pw{j}=transpose(sig(swave(i):ewave(i),1));
j=j+1;
l=length(swave(i):ewave(i));
if(m<l)m=l;
end
end
%pw
%m=max(length(pw(:,:)));
QRS=[];
for i=1:j-1
    if(length(pw{i})<m)
 %       size(pw{i})
  %      m
   %     length(pw{i})
    %    size(zeros(1,m-length(pw{i})))
        pw{i}=horzcat(pw{i},zeros(1,m-length(pw{i})));
        
    end
    QRS=[QRS;pw{i}];
end
QRS=mean(QRS);
QRS=QRS(QRS~=0);
%low=min(QRS(:))
%high=max(QRS(:))
%if(low>0)
%QRS=QRS-low;
%QRS=QRS/(high-low);

pw={};m=0;j=1;
%k=convhull(t,sig(:,1));
%plot(t(k),sig(k,1));
windowSize = 10;
b = (1/windowSize)*ones(1,windowSize);
a = 1;
%sig(:,1)=filter(b,a,sig(:,1));
%sig(:,1)=smooth(sig(:,1));%/norm(sig(:,1));
%plot(t,sig(:,1));
k=1;
for i=2:length(swave)
if(swave(i)<twave(1))
    k=i;
else
    break;
end
end
for i=k:3:length(ewave)
    
pw{j}=transpose(sig(swave(i):ewave(i),1));
j=j+1;
l=length(swave(i):ewave(i));
if(m<l)m=l;
end
end
%m=max(length(pw(:,:)));
T=[];
for i=1:j-1
    if(length(pw{i})<m)
       % size(pw{i});
        %m;
        length(pw{i});
       size(zeros(1,m-length(pw{i})));
        pw{i}=horzcat(pw{i},zeros(1,m-length(pw{i})));
        
    end
    T=[T;pw{i}];
end
T=mean(T);
T=T(T~=0);
low=min(T(:));
high=max(T(:));
%if(low>0)
%T=T-low;
%T=T/(high-low);
end
%plot(convhull(M(:)));
%plot(t(1:5000),sig(1:5000,1));

%hold on;grid on
%plot(t(swave(swave<=5000)),sig(swave(swave<=5000)),'or');
%hold on;
%plot(t(ewave(ewave<=5000)),sig(ewave(ewave<=5000)),'xg');

%ECGPUWAVE classifies each T wave as type 0 (normal), 1 (inverted), 2 (positive monophasic),
 %3 (negative monophasic), 4 (biphasic negative-positive), or 5 (biphasic positive-negative);
% this numeric classification is written into the num field of each TWAVE annotation.

%he num field of each WFON and WFOFF annotation designates
 %the type of waveform with which it is associated: 0 for a P wave, 1 for a QRS complex, or 2 for a T wave.
 
 %while using rdann if the output is taken as:
 % [twave,type,sub,cha,num,com] = rdann('rec_3','pqrst',[],10000,[],'t');
 % num contains the details of all the points in twave
 
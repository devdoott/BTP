curdir = pwd;
%x='rec_1';
x=strcat(strcat('af(',int2str(1)),')');
y='af';    

    %y=strcat('person_',int2str(1));
    %x=strcat('rec_',int2str(1));
[~,config]=wfdbloadlib;
eval(['cd ' config.WFDB_JAVA_HOME filesep y])
[t,sig] = rdsamp(x,[],5000); % for 20000 samples
%sqrs(x); %create qrs annotation file first
%ecgpuwave(x,'test',[],[],'qrs');
pwave = rdann(x,'test',[],5000,[],'p'); %P-peaks
twave = rdann(x,'test',[],5000,[],'t'); % T-peaks
swave = rdann(x,'test',[],5000,[],'('); %starts
ewave = rdann(x,'test',[],5000,[],')'); %ends
rw = rdann(x,'test',[],5000,[],'N');

save('time.mat','t');
tt=1;
%figure(2)
%plot(t,sig(:,1))
qloc=[];
rloc=[];
sloc=[];
tloc=[];
q=1;r=1;s=1;t=1;
for i=1:length(rw)
    while(q+1<=length(swave)&&swave(q+1)<rw(i))
        q=q+1;
    end
    while(s<=length(ewave)&&ewave(s)<rw(i))
        s=s+1;
    end
    while(t<=length(twave)&&twave(t)<rw(i))
        t=t+1;
    end
    if(ewave(s)>twave(t)&&swave(q)>rw(i)&&swave(q)>ewave(s)&&ewave(s)<rw(i))continue;
    else
        qloc=[qloc;swave(q)];
        rloc=[rloc;rw(i)];
        sloc=[sloc;ewave(s)];
        tloc=[tloc;twave(t)];
    end
end
[f1 f2 f3 f4 f5 f6 f7 f8 f9]=PVCfeatures(sig(:,1),qloc,rloc,sloc,tloc);
[Qwave qloc rloc sloc tloc]=ECGwaveGen(1);
qloc;
rloc;

[pf1 pf2 pf3 pf4 pf5 pf6 pf7 pf8 pf9]=PVCfeatures(Qwave,qloc,rloc,sloc,tloc);

featureMat=[f1 pf1;f2 pf2;f3 pf3;f4 pf4;f5 pf5;f6 pf6;f7 pf7;f8 pf8;f9 pf9];
n=length(featureMat(1,:))
cvec=[];
n1=length(f1);
n2=length(pf1)+n1;
for i=1:length(f1)
    cvec=[cvec;[0 0 1]];
end

for i=1:length(pf1)
    cvec=[cvec;[1 0 0]];
end
for i=1:9
    figure(i)
    z=plot(1:n1',featureMat(i,1:n1),'ob',n1+1:n2,featureMat(i,n1+1:n2),'or');
     set(z(1),'MarkerEdgeColor','none','MarkerFaceColor','r')
    
    set(z(2),'MarkerEdgeColor','none','MarkerFaceColor','b')
   
     h_l=legend('Beats with PVC','Normal Beats','Location','SouthOutside');
    set(h_l,'FontSize',12)
    xlabel('Beat No.','FontSize',14,'FontWeight','bold','Color','b')
    ylabel('Value','FontSize',14,'FontWeight','bold','Color','b')
    title(strcat({'PVC Feature '},int2str(i)),'FontSize',16)
    saveas(z(1),strcat(['PVCFeature',int2str(i),'.jpg']));
end
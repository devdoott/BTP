function [f,amp]=spect2(x,y)
curdir = pwd;
%x='rec_1';
%x=strcat(strcat('af(',int2str(1)),')');
%y='af';    
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
sig(:,1)=smooth(sig(:,1));
sig(:,1) = detrend(sig(:,1));
opol = 6;
[p,s,mu] = polyfit(t,sig(:,1),opol);
f_y = polyval(p,t,[],mu);
sig(:,1) = sig(:,1) - f_y;
tt=1;
%figure(2)
%plot(t,sig(:,1))
corr=[];l=[];j=1;tw=1;
m=0;
%k
for i=1:length(rw)-1
    
pw{j}=transpose(sig(rw(i):rw(i+1),1));
j=j+1;
l=length(rw(i):rw(i+1));
if(m<l)m=l;
end
end
avg=waveavg(pw,23);
%plot(avg)
%figure(1)
%plot(t,sig(:,1))
for i=1:length(rw)-1
    sig(rw(i):rw(i+1),1)=sig(rw(i):rw(i+1),1)-transpose(avg(1:(rw(i+1)-rw(i)+1)));
end
Fs = 250;             % Time vector
Mdata=sig(:,1);
%figure(2)
%plot(t,Mdata)
Mf=250;%   sampling rate / frequency (Hz)
%length(pwave)
%length(rw)
%length(twave)
%length(swave)
%length(ewave)
NFFT = 2 ^ nextpow2(length(Mdata)); 
Y = fft(double(Mdata), NFFT) / length(Mdata);
f = (double(Mf) / 2 * linspace(0, 1, NFFT / 2))'; % Vector containing frequencies in Hz
amp = 2 * abs(Y(1:(NFFT / 2)));
%f=f(f<=30);

%amp=amp(1:length(f));
%amp=smooth(amp);
%amp=amp/norm(amp);
amp(821:end-1)=amp(821:end-1).*0;
%figure(3)
%plot(f,amp)
folder='Atrial Analysis\';
g=plot(f(1:1000),amp(1:1000));
 xlabel('Frequency (Hz)','FontSize',14,'FontWeight','bold','Color','b')
    ylabel('Normalized Amplitude','FontSize',14,'FontWeight','bold','Color','b')
    title('Normalized frequecy spectrum','FontSize',16)
saveas(g,strcat(folder,y,x,'_AA_Spectrum2.jpg'));

g=plot(f(1:1000),smooth(amp(1:1000)));
 xlabel('Frequency (Hz)','FontSize',14,'FontWeight','bold','Color','b')
    ylabel('Normalized Amplitude','FontSize',14,'FontWeight','bold','Color','b')
    title('Normalized frequecy spectrum','FontSize',16)
saveas(g,strcat(folder,y,x,'_AA_SpectrumSmooth2.jpg'));


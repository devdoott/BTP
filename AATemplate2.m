clc

windowSize = 10;
b = (1/windowSize)*ones(1,windowSize);
a = 1;
p={};qrs={};t={};tp={};tqrs={};tt={};
load('Pavg.mat');
%s=[18 18 7 11 8 6 6];
s=[20 22 7 11 8 6 6];
h=[];
tot=[];
EntropyAF=[];esmoothAF=[];stempAF=[];stempsAF=[];
for j=1:23
    if(j==14)continue;end
    x=strcat(strcat('af(',int2str(j)),')')
    y='af';
   [f amp]=spect2(x,y);
    if(j==1)tot=amp
    else tot=tot+amp;
   end
   % length(f)
   % length(amp)
   %figure(j) 
   %plot(f,amp)
    %hold on
end


%hold on
%p{
%ttSmooth=ttSmooth/norm(ttSmooth);
%g=plot(f(1:1000),tot(1:1000));
% xlabel('Frequency (Hz)','FontSize',14,'FontWeight','bold','Color','b')
%    ylabel('Normalized Amplitude','FontSize',14,'FontWeight','bold','Color','b')
%    title('Normalized frequecy spectrum template of an AF episode','FontSize',16)
%folder='Atrial Analysis\';
%save(strcat(folder,'AFFeatures.mat'),'EntropyAF','esmoothAF','stempAF','stempsAF');

save(strcat(folder,'AATemplate2.mat'),'tot','f');
g=plot(f(1:1000),tot(1:1000));
 xlabel('Frequency (Hz)','FontSize',14,'FontWeight','bold','Color','b')
    ylabel('Normalized Amplitude','FontSize',14,'FontWeight','bold','Color','b')
   title('Normalized frequecy spectrum template of an AF episode','FontSize',16)
folder='Atrial Analysis\';
%save('AATemplate2.mat','tot','f');
saveas(g,strcat(folder,'AATemplate2.jpg'));

g=plot(f(1:1000),smooth(tot(1:1000)));
 xlabel('Frequency (Hz)','FontSize',14,'FontWeight','bold','Color','b')
    ylabel('Normalized Amplitude','FontSize',14,'FontWeight','bold','Color','b')
   title('Normalized frequecy spectrum template of an AF episode','FontSize',16)
folder='Atrial Analysis\';
saveas(g,strcat(folder,'AATemplate2Smooth.jpg'));
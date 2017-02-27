clc

windowSize = 10;
b = (1/windowSize)*ones(1,windowSize);
a = 1;
p={};qrs={};t={};tp={};tqrs={};tt={};
load('Pavg.mat');
%s=[18 18 7 11 8 6 6];
s=[20 22 7 11 8 6 6];
h=[];
%ttSmooth=[];
EntropyNorm=[];esmoothNorm=[];stempNorm=[];stempsNorm=[];
for j=1:7
    
    y=strcat('person_',int2str(j))
for i=1:s(j)
    x=strcat('rec_',int2str(i))
   [Entropy,esmooth,stemp,stemps]=spect(x,y);
   EntropyNorm=[EntropyNorm;Entropy];
   esmoothNorm=[esmoothNorm;esmooth];
   stempNorm=[stempNorm;stemp];
   stempsNorm=[stempsNorm;stemps];
    %if(j==1)ttSmooth=amp
    %else ttSmooth=ttSmooth+amp;
  % end
   % length(f)
   % length(amp)
   %figure(j) 
   %plot(f,amp)
    %hold on
end
end

%hold on
%p{
%ttSmooth=ttSmooth/norm(ttSmooth);
%g=plot(f(1:1000),ttSmooth(1:1000));
 %xlabel('Frequency (Hz)','FontSize',14,'FontWeight','bold','Color','b')
  %  ylabel('Normalized Amplitude','FontSize',14,'FontWeight','bold','Color','b')
   % title('Normalized frequecy spectrum template of an AF episode','FontSize',16)
folder='..\af\Atrial Analysis\';
save(strcat(folder,'NormalFeatures2.mat'),'EntropyNorm','esmoothNorm','stempNorm','stempsNorm');

%g=plot(f(1:1000),smooth(ttSmooth(1:1000)));
 %xlabel('Frequency (Hz)','FontSize',14,'FontWeight','bold','Color','b')
  %  ylabel('Normalized Amplitude','FontSize',14,'FontWeight','bold','Color','b')
 %   title('Normalized frequecy spectrum template of an AF episode','FontSize',16)
%folder='Atrial Analysis\';

%saveas(g,strcat(folder,'AATemplateWithSmoothingSmooth.jpg'));
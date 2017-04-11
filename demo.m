for j=1:1
    
    y=strcat('person_',int2str(j))
for i=1:1
    
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
    [output input ecgPlot]=processing(x,y)
    %input=[DKLAF';EAF';EntropyNorm';RRAF';h';stempNorm']

    %final=[final;finalProbability(input)];
end

end
%M=M./tot
%plot(final);
%folder='';
%save(strcat(folder,'AFprobMat.mat'),'M');

%save(strcat(folder,'FinalFeatures.mat'),'RRAF','EAF','DKLAF','EntropyNorm','esmoothNorm','stempNorm','stempsNorm','h','typ');

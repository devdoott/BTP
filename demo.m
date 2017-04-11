for j=1:1
    
    y=strcat('person_',int2str(j))
for i=1:1
    
    x=strcat('rec_',int2str(i))
  
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

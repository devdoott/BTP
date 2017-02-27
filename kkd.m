load('AATemplate2.mat');
tot=tot/norm(tot);

g=plot(f(1:1000),tot(1:1000));
 xlabel('Frequency (Hz)','FontSize',14,'FontWeight','bold','Color','b')
    ylabel('Normalized Amplitude','FontSize',14,'FontWeight','bold','Color','b')
   title('Normalized frequecy spectrum template of an AF episode','FontSize',16)
folder='Atrial Analysis\';
%save('AATemplate2.mat','tot','f');
saveas(g,strcat(folder,'NormalizedAATemplate2.jpg'));

g=plot(f(1:1000),smooth(tot(1:1000)));
 xlabel('Frequency (Hz)','FontSize',14,'FontWeight','bold','Color','b')
    ylabel('Normalized Amplitude','FontSize',14,'FontWeight','bold','Color','b')
   title('Normalized frequecy spectrum template of an AF episode','FontSize',16)
folder='Atrial Analysis\';
saveas(g,strcat(folder,'NormalizedAATemplate2Smooth.jpg'));

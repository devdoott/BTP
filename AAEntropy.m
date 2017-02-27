load('NormalFeatures2.mat');
load('AFFeatures2.mat');
hentropy=[];
s=[20 22 7 11 8 6 6];
k=1;
for j=1:22
    %if(j==14)continue;end
    x=strcat(strcat('af(',int2str(j)),')')
    hentropy=[hentropy;[7+j stempAF(k)-7+45]];
    k=k+1;
    %hold on
end
k=1;
for j=1:7
    
    y=strcat('person_',int2str(j))
for i=1:s(j)
    
    x=strcat('rec_',int2str(i))
hentropy=[hentropy;[j stempNorm(k)+45]];
k=k+1;

%hold on
%p{i}=P;qrs{i}=QRS;t{i}=T;
end
end
z=plot(hentropy(1:22,1),hentropy(1:22,2),'or',hentropy(23:length(hentropy),1),hentropy(23:length(hentropy),2),'ob');
grid on

    set(z(1),'MarkerEdgeColor','none','MarkerFaceColor','r')
    
    set(z(2),'MarkerEdgeColor','none','MarkerFaceColor','b')
    h_l=legend('Patients with atrial fibrillation','Normal Patients')
    set(h_l,'FontSize',16)
    xlabel('Patient No.','FontSize',14,'FontWeight','bold','Color','b')
    ylabel('D_K_L','FontSize',14,'FontWeight','bold','Color','b')
    title('D_K_L vs patient no.','FontSize',16)
    %saveas(z,'D_klvspatient.jpg');
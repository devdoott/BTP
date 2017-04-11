clc

windowSize = 10;
b = (1/windowSize)*ones(1,windowSize);
a = 1;
p={};qrs={};t={};tp={};tqrs={};tt={};
load('Pavg.mat');
s=[18 18 7 11 8 6 6];
%s=[20 22 7 11 8 6 6];
h=[]
for j=1:23
    if(j==2||j==10||j==11||j==14)continue;end
    x=strcat(strcat('af(',int2str(j)),')')
    h=[h;[7+j correlate(P,x,'af')]];
    %hold on
end
for j=1:7
    
    y=strcat('person_',int2str(j))
for i=1:s(j)
    x=strcat('rec_',int2str(i))
h=[h;[j correlate(P,x,y)]];

%hold on
%p{i}=P;qrs{i}=QRS;t{i}=T;
end
end
%h()
z=plot(h(1:19,1),h(1:19,2),'or',h(20:length(h),1),h(20:length(h),2),'ob');
grid on

    set(z(1),'MarkerEdgeColor','none','MarkerFaceColor','r')
    
    set(z(2),'MarkerEdgeColor','none','MarkerFaceColor','b')
    h_l=legend('Patients with atrial fibrillation','Normal Patients')
    set(h_l,'FontSize',16)
    xlabel('Patient No.','FontSize',14,'FontWeight','bold','Color','b')
    ylabel('R = Npw/Ncb','FontSize',14,'FontWeight','bold','Color','b')
    title('R vs patient no.','FontSize',16)
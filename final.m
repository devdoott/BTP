clc

windowSize = 10;
b = (1/windowSize)*ones(1,windowSize);
a = 1;
p={};qrs={};t={};tp={};tqrs={};tt={};

s=[20 22 7 7 2 6 6];
for j=1:7
    
    y=strcat('person_',int2str(j))
    p={};
for i=1:s(j)
    x=strcat('rec_',int2str(i))
[P QRS T]=wavefunc(x,y);
p{i}=transpose(P);qrs{i}=QRS;t{i}=T;
end
%size(P)
%size(p)
jjjjjjjjjjjjjjjj=p{1}
P=waveavg(p);
hahaha=size(P)
tp{j}=transpose(P);
%QRS=waveavg(qrs);
tqrs{j}=QRS;
%T=waveavg(t);
tt{j}=T;
%T=filter(b,a,T);
%QRS=filter(b,a,QRS);
%h=(j-1)*3;
%figure(1+h)
%plot(smooth(Pf));
%title(strcat('P wave :',y));
%xlabel({'Time','(units of 2 msec)'});
%ylabel({'Normalised Voltage','(mV)'});
%figure(2+h)
%plot(smooth(QRSf));
%title(strcat('QRS wave :',y));

%xlabel({'Time','(units of 2 msec)'});
%ylabel({'Normalised Voltage','(mV)'});
%figure(3+h)
%plot(smooth(Tf));

%xlabel({'Time','(units of 2 msec)'});
%ylabel({'Normalised Voltage','(mV)'});
%title(strcat('T wave :',y));
end

P=waveavg(tp);
%QRS=waveavg(tqrs);
%T=waveavg(tt);
%Tf=filter(b,a,T);
%Pf=filter(b,a,P);
%QRSf=filter(b,a,QRS);
y=' OVERALL'
figure(22)
plot(P);
title(strcat('P wave :',y));
xlabel({'Time','(units of 2 msec)'});
ylabel({'Normalised Voltage','(mV)'});
%figure(23)
%plot(smooth(QRSf));
%title(strcat('QRS wave :',y));
%xlabel({'Time','(units of 2 msec)'});
%ylabel({'Normalised Voltage','(mV)'});
%figure(24)
%plot(smooth(Tf));
%title(strcat('T wave :',y));
%xlabel({'Time','(units of 2 msec)'});
%ylabel({'Normalised Voltage','(mV)'});

clear all
clc
close all

%[filename,pathname]=uigetfile('*.txt','Open file .txt');
%filename
%/*if isequal(filename, 0) || isequal(pathname, 0)   
 %   disp('File input canceled.');  
%   ECG_Data = [];  
%else
%fid=fopen(filename,'r')
%end;
%size(filename)
%size(pathname)
%C=textscan(fid,'%f')
%length(C{1})
%plot(C{1}(1000:2000));
d=[];
for i=1:3
    s=strcat(strcat('samples_', num2str(i)),'.txt');
fid=fopen(s,'r');
C=textscan(fid,'%s %f');
%C{2}
%if(d~=0)
d=horzcat(d ,C{2});
%C{2}
%else
 %   d=C{2};
%end;
fclose(fid);
end
d=transpose(d);
av=mean(d)
%size(d)
%for i=1:length(d(:,1))
%av=[av;mean(d(1,:))];
%end

%for i=1:5
%fid=fopen(strcat(strcat('O', num2str(i)),'.txt'),'r');
%C=textscan(fid,'%f');
%d=[d C{1}];
%fclose(fid);
%end
plot(av(1000:3000));


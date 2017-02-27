function H=Entropy(x,y)
curdir = pwd;
%x='rec_1';
[~,config]=wfdbloadlib;
eval(['cd ' config.WFDB_JAVA_HOME filesep y])
[t,sig] = rdsamp(x,[],6000); % for 20000 samples
sqrs(x); %create qrs annotation file first
ecgpuwave(x,'test',[],[],'qrs');
rw = rdann(x,'test',[],5000,[],'N');
l=length(rw);
%sum=0;
diff=zeros(l-1,1);

num=[0 0 0];
for i=1:l-1
    diff(i)=rw(i+1)-rw(i);
end

me=mean(diff);
for i=1:l-1
    num(type(diff(i),me))=num(type(diff(i),me))+1;
end
num=num./(l-1);
M=zeros(3,3);
for i=1:l-2
    %num
    M(type(diff(i),me),type(diff(i+1),me))=M(type(diff(i),me),type(diff(i+1),me))+1;
end
M=M./(l-2);
A=zeros(3,3);
for i=1:3
    for j=1:3
        if(num(j)~=0)
        A(i,j)=M(i,j)/num(j);
        else
            A(i,j)=0;
        end
    end
end
h=[0 0 0];
for i=1:3
    for j=1:3
        h(i)=h(i)-A(j,i)*log2(A(j,i));
    end
end
H=0;
for i=1:3
    H=h(i)+num(i)*h(i);
end



    
    

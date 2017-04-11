function P=waveavg(pw,d)
j=length(pw);
%m=max(length(pw(:,:)));
m=0;
windowSize = 10;
b = (1/windowSize)*ones(1,windowSize);
a = 1;
for i=1:length(pw)
    
%pw{j}=transpose(sig(swave(i):ewave(i),1));
%j=j+1;

l=length(pw{i});
if(m<l)m=l;
end
end

zzzzzzzzzzzzz=pw{1};
P=[];
%j
for i=1:j
    if(length(pw{i})<m)
       
        %size(pw{i})
        %m
        %length(pw{i});
        %z=size(zeros(1,m-length(pw{i})))
        pw{i}=horzcat(pw{i},zeros(1,m-length(pw{i})));
        %if(z==m)pw{i}=transpose(pw{i});end
        
    end
    %size(P)
    i;
    kkkk=pw{i};
   % if(length(P)>0&&length(P(1,:))~=length())pw{i}=transpose(pw{i});
    %end
    P=[P;pw{i}];
end
aaa=size(P);
P;
P=mean(P);
P;
if(d==1)
    
P=P(P~=0);
P
%hmmm=size(P)
low=min(P(:));
high=max(P(:));
%if(low>0)
P=P-low;
P=P/(high-low);
P=filter(b,a,P);
P=smooth(P);
end
end

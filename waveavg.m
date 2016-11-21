function P=waveavg(pw)
j=length(pw)
%m=max(length(pw(:,:)));
m=0;
for i=1:length(pw)
    
%pw{j}=transpose(sig(swave(i):ewave(i),1));
%j=j+1;
l=length(pw{i})
if(m<l)m=l;
end
end
P=[];
for i=1:j
    if(length(pw{i})<m)
        %size(pw{i});
        %m;
        %length(pw{i});
        %size(zeros(1,m-length(pw{i})));
        pw{i}=horzcat(pw{i},zeros(1,m-length(pw{i})));
        
    end
    P=[P;pw{i}];
end
P=mean(P);
P=P(P~=0);
low=min(P(:));
high=max(P(:));
%if(low>0)
P=P-low;
P=P/(high-low);
end

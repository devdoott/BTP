function t=type(val,mean)
if(val<=0.85*mean)
    t=1;
elseif(val<=1.15*mean)
        t=2;
else
    t=3;
end
    
function z=node(t,x)
z=zeros(2,1);
z(1)=x(2);
z(2)=6*sin(t)-x(1)^5-0.1*x(2);
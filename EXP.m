s=zpk([],[0,-1,-2],-1)

%nyquist(s)
%figure()
%bode(s)

allmargin(s)
[A,B,C,D]=tf2ss([10],[1 2 8]);
rank(ctrb(A,B))
rank(obsv(A,C))
lyap(A,[1 0;0 1])

[A B C D]=tf2ss([1325],[1 101.71 171 0]);
place(A,B,roots([1 48 365.8 1832]))
place(A,B,roots([1 480 3658 1833000]))
t=[0 50];
x=[2;3];
[t,x]=ode45('node',t,x);
plot(t,x(:,1))
hold
x=[2.01;3.01];
[t,x]=ode45('node',t,x);
plot(t,x(:,1))

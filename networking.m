t = tcpip('0.0.0.0', 30000, 'NetworkRole', 'server');
display('started')
try
fopen(t);
display('New Connection')

while t.BytesAvailable==0
   
    pause(1);
    
    disp('wait')
    
end
data = fread(t, t.BytesAvailable)
fclose(t);
catch
    display('closed')
    fclose(t);
end
%plot(data);
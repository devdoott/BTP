function [f1 f2 f3 f4 f5 f6 f7 f8 f9] = PVCfeatures(ecgwave, qloc, rpeak, sloc, tpeak)

nbeats = length(qloc);
qrslen = zeros(1,nbeats);

for i = 1:nbeats
    qrslen(i) = sloc(i) - qloc(i);
end
f1 = zeros(1,nbeats);
qrslenrms=rms(qrslen);
for i = 1:nbeats
    f1(i) = qrslen(i)*log(qrslen(i)/mean(qrslenrms));
end
qrsarea = zeros(1,nbeats);
for i = 1:nbeats
    qrswave = zeros(1,sloc(i) - qloc(i)+1);
    k=1;
    for j = qloc(i):sloc(i)
        qrswave(k) = ecgwave(j);
        k = k+1;
    end
    trapz(qrswave);
    qrsarea(i) = trapz(qrswave);
end

f2 = zeros(1,nbeats);
for i = 1:nbeats
    f2(i) = qrsarea(i)*log(qrsarea(i)/mean(qrsarea));
end
f3 = zeros(1,nbeats);
f4 = zeros(1,nbeats);
for i = 1:nbeats
    f3(i) = qrsarea(i)/(sloc(i)-qloc(i));
end
for i = 1:nbeats
    f4(i) = f3(i)*log(f3(i)/mean(f3));
end

f5 = zeros(1,nbeats);
f6 = zeros(1,nbeats);
for i = 1:nbeats
    f5(i) = ecgwave(tpeak(i));
end
for i = 1:nbeats
    f6(i) = f5(i)*log(f5(i)/mean(f5));
end
rr = zeros(1,nbeats-1);
for i = 1:nbeats-1
    rr(i) = rpeak(i+1) - rpeak(i);
end
f7 = zeros(1,nbeats-1);
for i = 2:nbeats-1
    f7(i) = rr(i-1)/rr(i);
end
diffQR = zeros(1,nbeats);
diffRS = zeros(1,nbeats);
for i = 1:nbeats
    for j = qloc(i):rpeak(i)
        if diffQR(i) < ecgwave(j+1) - ecgwave(j)
            diffQR(i) = ecgwave(j+1) - ecgwave(j);
        end
    end
end
for i = 1:nbeats
    for j = rpeak(i):sloc(i)
        if diffRS(i) < ecgwave(j+1) - ecgwave(j)
            diffRS(i) = ecgwave(j+1) - ecgwave(j);
        end
    end
end
f8 = zeros(1,nbeats);
f9 = zeros(1,nbeats);
for i = 1:nbeats
    f8(i) = diffQR(i)*log(diffQR(i)/mean(diffQR));
end
for i = 1:nbeats
    f9(i) = diffRS(i)*log(diffRS(i)/mean(diffRS));
end

n=length(f7);
f1=real(f1(1:n));
f2=real(f2(1:n));
f3=real(f3(1:n));
f4=real(f4(1:n));
f5=real(f5(1:n));
f6=real(f6(1:n));
f7=real(f7);
f8=real(f8(1:n));
f9=real(f9(1:n));
end

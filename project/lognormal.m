%%
clc;
clear;
s = input('inter sigma  ');
b = input('inter mean   ');    
for i = 1:50000
   a(i) = STDNormal();
end
n = s*a+b;
log_normal = exp(n);
figure;
subplot(2,1,1);
hist(exp(n),1000)
xlim([0,10])
xlabel('X');
ylabel('N');
title('LOGNORNAML DISTURBUTION HISTOGRAM-recejction method');
grid on;
grid minor;
[n,y] = hist(exp(n),100000);
D = (max(exp(n))-min(exp(n)))/10000;
F = n/(D* length(n));
subplot(2,1,2);
plot(y,F,'g','Linewidth',1);
xlim([0,10])
xlabel('X');
ylabel('PDF');
title('LOGNORNAML DISTURBUTION-recejction method');
grid on;
grid minor;
%%
clc;clear;
u = rand(1,1000000);
v = rand(1,1000000);
s = input('inter sigma  ');
b = input('inter mean   ');  
z = sqrt(-2*log(v)).*cos(pi*(2-u));
figure;
subplot(2,1,1);
hist(exp(s.*z+b),10000)
xlim([0,10])
xlabel('X');
ylabel('N');
title('LOGNORNAML DISTURBUTION HISTOGRAM-polar method');
grid on;
grid minor;
[n,y] = hist(exp(s.*z+b),10000);
D = (max(exp(z))-min(exp(z)))/10000;
F = n/(D* length(z));
subplot(2,1,2);
plot(y,F,'g','Linewidth',1);
xlim([0,10])
xlabel('X');
ylabel('PDF');
title('LOGNORNAML DISTURBUTION-polar method');
grid on;
grid minor;
%%
clc;clear
a = zeros(1,100000);
s = input('inter sigma  ');
b = input('inter mean   ');  
for i = 1:100000
    temp = rand(1,100000);
    a(i) = (sum(temp)/length(temp)-0.5)*10^3;
end
a = s*a +b;
figure;
subplot(2,1,1);
hist(exp(a),10000)
xlim([0,10])
xlabel('X');
ylabel('N');
title('LOGNORNAML DISTURBUTION HISTOGRAM-clt method');
grid on;
grid minor;
[n,y] = hist(exp(s.*a+b),10000);
D = (max(exp(a))-min(exp(a)))/10000;
F = n/(D* length(a));
subplot(2,1,2);
plot(y,F,'g','Linewidth',1);
xlim([0,10])
xlabel('X');
ylabel('PDF');
title('LOGNORNAML DISTURBUTION-clt method');
grid on;
grid minor;

function [x] = STDNormal()
% generate standard normal distribution using Acceptance-rejection method
rng('shuffle');

y1=-log(rand);
y2=-log(rand);

while y2<((y1-1).^2)/2
    y1=-log(rand);
    y2=-log(rand);
end

abs_z=y1;

u=rand;
if u<=0.5
    z=abs_z;
else
    z=-abs_z;
end
x=z;
end





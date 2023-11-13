clear all; 
omega0 = 4; c = 3;
OMEGA =2:0.01:5;
C = zeros(size(OMEGA));
Ctheory = zeros(size(OMEGA)); 
t0 = 0; y0 = 3; v0 = 4; Y0 = [y0;v0]; tf =30; t1 = 9;

for k = 1:length(OMEGA)
   omega = OMEGA(k);
   param = [omega0,c,omega];
   [t,Y] = ode45(@f,[t0,tf],Y0,[],param); 
   i = find(t>t1); 
   C(k) = (max(Y(i,1))-min(Y(i,1)))/2; 
   Ctheory(k) = 1/sqrt((omega0^2-OMEGA(k)^2)^2+(c*OMEGA(k))^2); 
end 

figure 
plot(OMEGA,C,'r-o','MarkerIndices',1:2:length(OMEGA)); grid on; 
hold on; plot(OMEGA,Ctheory,'b-',LineWidth=1.7)
xlabel('\omega'); ylabel('C'); 
legend('computed numerically','theoretical') 
title('Amplitude as a function of \omega (y0 = 3; v0 = 4)')


%---------------------------------------------------------
function dYdt = f(t,Y,param) 
y = Y(1); v = Y(2); 
omega0 = param(1); c = param(2); omega = param(3);
dYdt = [ v ; cos(omega*t)-omega0^2*y-c*v ]; 
end
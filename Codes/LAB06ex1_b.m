clear all;  
omega0 = 4; c = 3; omega = 4.5; 
param = [omega0,c,omega]; 
t0 = 0; y0 = 0; v0 = 0; Y0 = [y0;v0]; tf = 30;
options = odeset('AbsTol',1e-10,'relTol',1e-10); 
[t,Y] = ode45(@f,[t0,tf],Y0,options,param); 
y = Y(:,1); v = Y(:,2); 

alpha = pi + atan(c*omega/(omega0^2-omega^2));         % w0 < w
Ctheory = 1/sqrt((omega0^2-omega^2)^2+(c*omega)^2);    % c < 2w0
yc = y - Ctheory*cos(omega*t-alpha);

figure 
plot(t,yc,'b-',LineWidth=1.5); 
xlabel('t'); ylabel('y(t)'); grid on; 
ylim([-.04 .03]); hold on; plot(t,0.07065*exp(-3*t/2),'r:',t,-0.07065*exp(-3*t/2),'r:')
title("The Complementary Solution: yc"); legend("yc","+/- 0.07065*exp(-3t/2)")


%----------------------------------------------------------------
function dYdt = f(t,Y,param) 
y = Y(1); v = Y(2); 
omega0 = param(1); c = param(2); omega = param(3);
dYdt = [ v ; cos(omega*t)-omega0^2*y-c*v ];
end
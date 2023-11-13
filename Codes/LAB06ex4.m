clear all;
omega0 = 4; c = 0; omega = 4.2; 
param = [omega0,c,omega]; 
t0 = 0; y0 = 0; v0 = 0; Y0 = [y0;v0]; tf = 80;
options = odeset('AbsTol',1e-10,'relTol',1e-10); 
[t,Y] = ode45(@f,[t0,tf],Y0,options,param); 
y = Y(:,1); v = Y(:,2); 

figure 
plot(t,y,'b-'); xlabel('t'); ylabel('y(t)'); grid on; 
title("Beats Phenomenon (c=0, \omega=4.2)"); legend("y = yc + yp")


%----------------------------------------------------------------
function dYdt = f(t,Y,param) 
y = Y(1); v = Y(2); 
omega0 = param(1); c = param(2); omega = param(3);
dYdt = [ v ; cos(omega*t)-omega0^2*y-c*v ];
end
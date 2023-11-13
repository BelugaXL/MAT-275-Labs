clear all; %this deletes all variables 
omega0 = 4; c = 3; omega = 4.5; 
param = [omega0,c,omega]; 
t0 = 0; y0 = 0; v0 = 0; Y0 = [y0;v0]; tf = 30;
options = odeset('AbsTol',1e-10,'relTol',1e-10); 
[t,Y] = ode45(@f,[t0,tf],Y0,options,param); 
y = Y(:,1); v = Y(:,2); 

figure 
plot(t,y,'b-'); xlabel('t'); ylabel('y(t)'); grid on; ylim([-.1 .1])
title("Figure 1: Forced oscillation"); legend("y = yc + yp")

t1 = 9; i = find(t>t1);
C = (max(Y(i,1))-min(Y(i,1)))/2; 
disp(['Computed amplitude of forced oscillation = ', num2str(C)]);
Ctheory = 1/sqrt((omega0^2-omega^2)^2+(c*omega)^2); 
disp(['Theoretical amplitude = ', num2str(Ctheory)]);


%----------------------------------------------------------------
function dYdt = f(t,Y,param) 
y = Y(1); v = Y(2); 
omega0 = param(1); c = param(2); omega = param(3);
dYdt = [ v ; cos(omega*t)-omega0^2*y-c*v ];
end
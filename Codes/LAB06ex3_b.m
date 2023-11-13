clear all; 
omega0 = 4; c = 0; omega = 4; 
param = [omega0,c,omega]; 
t0 = 0; y0 = 0; v0 = 0; Y0 = [y0;v0]; tf = 30;
options = odeset('AbsTol',1e-10,'relTol',1e-10); 
[t,Y] = ode45(@f,[t0,tf],Y0,options,param); 
y = Y(:,1); v = Y(:,2); 

figure 
plot(t,y,'b-'); xlabel('t'); ylabel('y(t)'); grid on; 
hold on; plot(t,-t/8,'r:',t,t/8,'r:')
title("Resonance (\omega0 = \omega = 4)")
legend("y = yc + yp",'+/- t/8',Location="northwest")


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
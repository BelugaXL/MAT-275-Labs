clear all;     % clear all variables 

m = 1;  % mass [kg]
k = 4;  % spring constant [N/m]
c = 1;  % friction coefficient [Ns/m]
omega0 = sqrt(k/m); p = c/(2*m); 
% initial conditions
y0 =-0.6;  
v0 = -0.6; 

[t,Y] = ode45(@f,[0,10],[y0,v0],[],omega0, p);  % solve for 0<t<10
y = Y(:,1); v = Y(:,2);                         % retrieve y, v from Y 
E = 0.5*m*v.^2 + 0.5*k*y.^2;

figure
plot(t,y,'ro-',t,v,'b+-');                      % time series for y, v, & E 
hold on
plot(t,E,LineWidth=2)
title("Damped Harmonic Motion","Interpreter","latex","FontSize",14)
legend("y(t)","v(t)=y'(t)","Energy","Interpreter","latex")
xlabel("t (s)","Interpreter","latex","FontSize",14)
ylabel("x (m), v (m/s) ","Interpreter","latex","FontSize",14)
grid on; axis tight; 


%---------------------------------------------------
function dYdt = f(t,Y,omega0,p);  % function defining the DE 
y = Y(1); v = Y(2); 
dYdt=[ v ; -omega0^2*y-2*p*v ];   % fill-in dv/dt
end
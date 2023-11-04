clear all;     % clear all variables 
m = 1;  % mass [kg]
k = 4;  % spring constant [N/m]

c = 2;  % friction coefficient [Ns/m]
omega0 = sqrt(k/m); p = c/(2*m); 
y0 =-0.6;  v0 = -0.6; % initial conditions
[t,Y] = ode45(@f,[0,10],[y0,v0],[],omega0, p); % solve for 0<t<10
y = Y(:,1); v = Y(:,2); % retrieve y, v from Y 
figure
plot(t,y,'ro-',t,v,'b+-');% time series for y and v 
title("Damped Harmonic Motion; c = 2 (Ns/m)","Interpreter","latex","FontSize",14)
legend("y(t)","v(t)=y'(t)","Interpreter","latex")
xlabel("t (s)","Interpreter","latex","FontSize",14)
ylabel("x (m), v (m/s) ","Interpreter","latex","FontSize",14)
grid on; axis tight; 

c = 4;  % friction coefficient [Ns/m]
omega0 = sqrt(k/m); p = c/(2*m); 
y0 =-0.6;  v0 = -0.6; % initial conditions
[t,Y] = ode45(@f,[0,10],[y0,v0],[],omega0, p); % solve for 0<t<10
y = Y(:,1); v = Y(:,2); % retrieve y, v from Y 
figure
plot(t,y,'ro-',t,v,'b+-');% time series for y and v 
title("Damped Harmonic Motion; c = 4 (Ns/m)","Interpreter","latex","FontSize",14)
legend("y(t)","v(t)=y'(t)","Interpreter","latex")
xlabel("t (s)","Interpreter","latex","FontSize",14)
ylabel("x (m), v (m/s) ","Interpreter","latex","FontSize",14)
grid on; axis tight; 

c = 12;  % friction coefficient [Ns/m]
omega0 = sqrt(k/m); p = c/(2*m); 
y0 =-0.6;  v0 = -0.6; % initial conditions
[t,Y] = ode45(@f,[0,10],[y0,v0],[],omega0, p); % solve for 0<t<10
y = Y(:,1); v = Y(:,2); % retrieve y, v from Y 
figure
plot(t,y,'ro-',t,v,'b+-');% time series for y and v 
title("Damped Harmonic Motion; c = 2 (Ns/m)","Interpreter","latex","FontSize",14)
legend("y(t)","v(t)=y'(t)","Interpreter","latex")
xlabel("t (s)","Interpreter","latex","FontSize",14)
ylabel("x (m), v (m/s) ","Interpreter","latex","FontSize",14)
grid on; axis tight; 


%---------------------------------------------------
function dYdt = f(t,Y,omega0,p); % function defining the DE 
y = Y(1); v = Y(2); 
dYdt=[ v ; -omega0^2*y-2*p*v ];   % fill-in dv/dt
end
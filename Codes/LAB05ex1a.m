clear all; 

m = 1;    % mass [kg]
k = 4;    % spring constant [N/m]
omega0 = sqrt(k/m); 
% initial conditions
y0 = -0.6;  
v0 = -0.6; 

[t,Y] = ode45(@f,[0,10],[y0,v0],[],omega0); % solve for 0<t<10
y = Y(:,1); v = Y(:,2);  % retrieve y, v from Y 
figure
plot(t,y,'ro-',t,v,'b+-')  % time series for y and v 
title("Analyzing the Graph","Interpreter","latex","FontSize",14)
legend
xlabel("t (s)","Interpreter","latex","FontSize",14)
ylabel("x (m), v (m/s) ","Interpreter","latex","FontSize",14)
axis tight
grid on


%---------------------------------------------------
function dYdt = f(t,Y,omega0); % function defining the DE 
y = Y(1); v = Y(2); 
dYdt=[ v ; - omega0^2*y ];
end
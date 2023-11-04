t0 = 0; tf = 60; 
Y0 = [-1;0;-0.5]; % [y(0); v(0); w(0)]

[t,Y] = ode45(@f,[t0,tf],Y0,[]);
y = Y(:,1); v = Y(:,2); w = Y(:,3);   % Y in output has 3 columns corresponding to y, v, and w

figure
plot(t,y,'b',t,v,'r',t,w,'k',LineWidth=1)
ylim([-3.1,3.1])
grid on

xlabel('t',"Interpreter","latex"); ylabel("y,v=y'","Interpreter","latex")
legend('y(t)','v(t)','w(t)',"Interpreter","latex")
title(strcat("y'''",'+5(y^2)y"',"+(10y)(y')^2+4y'=5sin(t)",' ,y(0)=-1,v(0)=0,w(0)=-0.5'))

figure
plot3(y,v,w,LineWidth=1);   % plot the phase plot
hold on;
view([-40, 60])  % Azimuth=-40 and Elevation=60 (Angle)
xlabel('y'); ylabel('v=y'''); zlabel('w=y''''');
grid on 

title("Phase Plot")

%----------------------------------------------------------------------
function dYdt = f(t,Y)
y=Y(1); v=Y(2); w=Y(3);
dYdt = [v; w; 5*cos(t)-5*y^2*w-10*y*v^2-4*v];
end
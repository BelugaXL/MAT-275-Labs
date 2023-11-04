t0 = 0; tf = 60; 
Y0 = [-1;0];

[t,Y] = ode45(@f,[t0,tf],Y0,[]);
y = Y(:,1); v = Y(:,2);    % Y in output has 2 columns corresponding to y and v

[te,Ye] = euler(@f,[t0,tf],Y0,5000);  % solve the ODE using Euler's 5000 steps

figure
plot(t,y,'k',te,Ye(:,1),'r--',LineWidth=1.5)
ylim([-3.1,3.1])
grid on

xlabel('t',"Interpreter","latex"); ylabel("y,v=y'","Interpreter","latex")
legend('y(t)','Euler N = 5000',"Interpreter","latex")
title(strcat('y"',"+(5y^2)y'+4y=5sin(t)",' ,y(0)=-1,v(0)=0'))



%----------------------------------------------------------------------
function dYdt = f(t,Y)
y=Y(1); v=Y(2);
dYdt = [v; 5*sin(t)-5*y^2*v-4*y];
end
t0 = 0; tf = 60; 
Y0 = [-1.5;1.3];

[t,Y] = ode45(@f,[t0,tf],Y0,[]);
y = Y(:,1); v = Y(:,2);    % Y in output has 2 columns corresponding to y and v

figure
plot(t,y,'b',t,v,'r',LineWidth=1)
ylim([-3.1,3.1])
grid on

xlabel('t',"Interpreter","latex"); ylabel("y,v=y'","Interpreter","latex")
legend('y(t)','v(t)',"Interpreter","latex")
title(strcat('y"',"+5y'+4y=5sin(t)",' ,y(0)=-1.5,v(0)=1.3'),"Interpreter","latex")

figure
plot(y,v,LineWidth=1);   % plot the phase plot
axis square 
ylim([-3.1,3.1])
xlim([-2.6,2.6])
grid on 

xlabel('y',"Interpreter","latex"); ylabel("v=y'","Interpreter","latex")
title("Phase Plot","Interpreter","latex")

%----------------------------------------------------------------------
function dYdt = f(t,Y)
y=Y(1); v=Y(2);
dYdt = [v; 5*sin(t)-5*v-4*y];
end
x = 0:0.001:8 ; % define the vector x in the interval [0 ,8]
y1 = f (x,640) ; % compute the solution with C = 640
y2 = f (x,1070) ; % compute the solution with C = 1070
y3 = f (x,1600) ; % compute the solution with C = 1600
plot (x,y1,'b-',x,y2,'r--',x,y3,'k-.') 
title ("Solutions to $dy/dx = -9x -17x^2 - 14cos(x)$","Interpreter","latex") 
legend ("C = 640","C = 1070","C = 1600","Interpreter","latex") 
xlabel("x","Interpreter","latex")
ylabel("y","Interpreter","latex")

function y = f(x,C)
% fill -in with the expression for the general solution
y = -9/2*x -17/3*x.^3 - 14*sin(x) + C;
end
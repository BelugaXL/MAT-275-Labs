 function [t,y] = impeuler(f,tspan,y0,N)

% Modified codes from euler.m

m = length(y0);
t0 = tspan(1);
tf = tspan(2);
h = (tf-t0)/N;             
t = linspace(t0,tf,N+1);    
y = zeros(m,N+1);   
y(:,1) = y0';             
for n=1:N
    f1 = f(t(n),y(:,n));
    f2 = f(t(n)+h,y(:,n)+h*f1);
    y(:,n+1) = y(:,n) + 0.5*h*(f1+f2);   
end
t = t'; y = y';    
end
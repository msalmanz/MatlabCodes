function T = trapezoid(f,a,b,n)
h=(b-a)/n;
t=a+h*(0:n)';
y=f(t);
T=h*(sum(y(2:n))+0.5*(y(1)+y(n+1)));
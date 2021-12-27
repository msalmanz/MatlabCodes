function S = simpson(f,a,b,n)
% Note n must be an even number
h=(b-a)/n;
t=a+h*(0:n);
y=f(t);
S=(h/3)*(4*sum(y(2:2:n))+2*sum(y(3:2:n-1))+y(1)+y(n+1));
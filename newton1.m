function x = newton1
f=@(x) x.*exp(x)-2;
fp=@(x) (x+1).*exp(x);
x(1)=1; % initial guess
for i=1:10
    x(i+1)=x(i)-f(x(i))/fp(x(i));
end;
x=x';
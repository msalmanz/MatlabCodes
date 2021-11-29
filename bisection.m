function sol = bisection(f,a,b,tol)
%% BISECTION:  Bisection Method
%       Computes approximate solution of f(x)=0
%       Input: function handle f; a,b such that f(a)*f(b)<0, 
%           and tolerance tol
%       Output: approximate solution xc; number of iterations
%           nost
%       Usage: [xc,nost] = bisection(f,a,b,tol)
%% check whether the assumptions are fulfilled
if sign(f(a))*sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end

%% bisection method
fa = f(a);  % evaluate f at intervall boundary a
fb = f(b);  % evaluate f at intervall boundary b  
nost = 0;   %number of bisection steps
while (b-a)/2 > tol
  nost = nost+1;    % count number of bisection steps
  c = (a+b)/2;
  fc = f(c);    % evaluate f at c
  if fc == 0    % c is a solution, done
    break
  end
  if sign(fc)*sign(fa) < 0  % a and c make the new interval
    b = c;      % substitute b by c
    fb = fc;
  else          % c and b make the new interval
    a = c;      % substitute a by c
    fa = fc;
  end
end
xc=(a+b)/2;  % new midpoint is best estimate of the root
fprintf('The root and number of steps are') 
sol = [xc,nost];   
function sol = bisectShow(f,a,b,tol)
%% BISECTION:  Bisection Method
%       Computes approximate solution of f(x)=0
%       Input: function handle f; a,b such that f(a)*f(b)<0, 
%           and tolerance tol
%       Output: approximate solution xc; number of iterations k
%           
%       Usage: [xc,k] = bisection(f,a,b,tol)
%% check whether the assumptions are fulfilled
if sign(f(a))*sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end

%% bisection method
k=0;   %number of bisection steps
fa = f(a);  % evaluate f at intervall boundary a
fb = f(b);  % evaluate f at intervall boundary b  
 fprintf('  k,  a,      f(a), b,      f(b), c,     f(c)\n')
while (b-a)/2 > tol 
  c = (a+b)/2;
  fc = f(c);
  fprintf('%3.0f, %8.5f, %s , %8.5f, %s , %8.5f, %s \n',k,a,pm(fa),b,pm(fb),c,pm(fc))
  k=k+1;  %  count number of bisection steps
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
xc=(a+b)/2; % new midpoint is best estimate of the root
sol = [xc,k];   

function s=pm(x)
if sign(x)>=0
    s='+';
else
    s='-';
end
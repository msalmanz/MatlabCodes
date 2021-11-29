function z=newton4sys
format long

% This code uses Newton's iterative method to solve a system of 
% nonlinear equations f(x)=0, given an initial guess that's close enough
% to the solution. The iteration fails when there is no convergence.
% If the iteration converges, the best solution to the system is 
% the last row in the output.

%=======================================================
% The following segment is the part where you enter the function f,
% the Jacobian J of f, initial guess x0, and the number of iterations.
% The function f can have any number of variables, and of course J and x0
% have to be modified accordingly.

f=@(x) [x(1)^2+2*x(2)^2-4;x(1)*x(2)-1]; % the function f of the system
J=@(x) [2*x(1), 4*x(2);x(2), x(1)]; % the Jacobian matrix of f
x0=[2;.5]; %initial guess
n_iter=10; % number of iterations

%x0=[.5;2];
%x0=[-.5;-2];
%x0=[-2;-.5];

% Information regarding the entered set of equations:
% This system has 4 different solutions as a result of the
% intersection of the circle x^2+y^2=4, and the hyperbola xy=1.
% Note also that the function handler can allow the input and the output 
%to be a multi variable column or matrix.
% Here is an initial guess that's close to one of the solutions:
% In this example, you can also try guesses that are close to the other
% three solutions such as [.5;2], [-.5;-2], [-2,-0.5]

%========================================================

tol=10e-16;
x=x0;
z=x; % the generated sequesnce will be saved in z
for i=1:n_iter
s=J(x)\f(x); % Here we replace the matrix inversion by a solution of a linear system.
x=x-s;
z=[z,x];

err=norm(s,inf);
  if err< tol  % Whn s has a small norm, stop the iteration and report the solution.
     fprintf('The iteration converges to'), x=x'
      break
  end
end
z=z';
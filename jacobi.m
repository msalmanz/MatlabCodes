function x = jacobi (A, b, I)

%*****************************************************************************80
%
% JACOBI1 carries out one step of the Jacobi iteration.
%
%  Input:
%    A: the matrix.
%    b: the right hand side.
%    I: number of iterations
%  Output:
%    x, the improved estimate of the solution.
%
n=length(b); % How many components in b 
d = diag(A); % extract the diagonal of A creating a column d
R = A-diag(d); % Split the matrix A into L+D+U, where R=A-D=L+U
x=zeros(n,1); % Initial guess;
%z=x;
  for i = 1:I
      x = (b-R*x)./d;
      %z=[z,x];
  end
%z'
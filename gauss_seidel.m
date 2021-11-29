function [x,itr,err2] = gauss_seidel(A, b)

% Gauss Seidel Method
% Solution of x in Ax=b using Gauss Seidel Method

n=length(b);
x=zeros(n,1);
normVal=Inf; 
% 
%tol=1e-5; 
itr=0;
%% Algorithm: Gauss Seidel Method

%while err2>tol
for l=1:10 % Number of Gauss-Seidel iterations
    x_old=x;
    
    for i=1:n
        
        sigma=0;
        
        for j=1:i-1
                sigma=sigma+A(i,j)*x(j);
        end
        
        for j=i+1:n
                sigma=sigma+A(i,j)*x_old(j);
        end
        
        x(i)=(1/A(i,i))*(b(i)-sigma);
    end
    
    itr=itr+1;
    err2=norm(x_old-x);
end
%%
%fprintf('Solution of the system is : \n%f\n%f\n%f,\n in %3.0f iterations, within %.2g error',x,itr,tol);
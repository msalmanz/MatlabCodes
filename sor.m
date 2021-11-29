function [x,itr,err2] = sor(A, b,w)

% SOR Method
% Solution of x in Ax=b using SOR Method

n=length(b);
x=zeros(n,1);
%normVal=Inf; 
% 
%tol=1e-3; 
itr=0;
%% Algorithm: SOR Method

%while err2>tol
for l=1:6 % Number of SOR iterations
x_old=x;
    
    for i=1:n
        
        sigma=0;
        
         for j=1:i-1
                sigma=sigma+A(i,j)*x(j);
         end
        
         for j=i+1:n
                sigma=sigma+A(i,j)*x_old(j);
         end
        
        x(i)=(1-w)*x_old(i)+w*(1/A(i,i))*(b(i)-sigma);
   end
    
    itr=itr+1;
    err2=norm(x_old-x,Inf);
end
%fprintf('Solution of the system is : \n%f\n%f\n%f,\n in %3.0f iterations, within %.2g error',x,itr,tol);
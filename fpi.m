function z=fpi(g,x0,k)
  z=[x0];
  x=x0;
  for i=1:k
    x=g(x);
    z=[z;x];
  end
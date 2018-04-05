function [root] = root_newton_function( testf, testderivf, a, b) 
% This is an example use of the plot function 
% used in association with the finding of a root
% problem solved earlier.
%  a is the lower value of the range eg. a=0
% b is the upper value of the range  eg b=3

fa = -inf;
fb = inf;
delta = (b-a)/100;
xx = a:delta:b;
%plot(xx,xx .^3-2*xx-5);
plot(xx,testf(xx));
hold on

hax = line([a,b],[0,0]);
set(hax,'Color','red');
x=b;
while (sqrt((x-a)^2))>0.0001

  a=x;
  %fx = x^3-2*x-5;
  %dfx= 3*x^2-2;
  
  fx = testf(x);
  dfx= testderivf(x);
  x=a-(fx/dfx);
  
   
  plot(x,fx,'o')
  
  disp(x-a);
end;
root=x;
disp(' The root is :');
disp(root);


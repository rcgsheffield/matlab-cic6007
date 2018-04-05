% This is an example use of the plot function 
% used in association with the finding of a root
% problem solved earlier.
%  a is the lower value of the range
% b is the upper value of the range

a = 0;
b = 3;
hf= @testf;
hderivf= @testderivf;

fa = -inf;
fb = inf;
delta = (b-a)/100;
xx = a:delta:b;


%plot(xx,xx .^3-2*xx-5);
plot(xx,hf(xx));
hold on

hax = line([a,b],[0,0]);
set(hax,'Color','red');
x=b;
while (sqrt((x-a)^2))>0.0001

  a=x;
  %fx = x^3-2*x-5;
  %dfx= 3*x^2-2;
  
  fx = hf(x);
  dfx= hderivf(x);
  x=a-(fx/dfx);
  
   
  plot(x,fx,'o')
  
  disp(x-a);
end;

disp(' The root is :');
disp(x);


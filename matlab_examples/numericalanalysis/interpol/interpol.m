%Using lagrange interpolation polynomial
n=20;  %size of interval

%use an odd number of elements
n=(n*2)+1;

%interval for polynomial
a=-4;
b=3;

%interval for sine function
%a=0;
%b=pi/2;

h=(b-a)/n;
x=a:h:b;

%try modifying the test function
for i=1:n+1
    y(i)=testfunction(x(i));
end

%test at one point, is this correct?
f=y;
xval=1.43;
ii=20;
val=lagrange_interp(xval,f,x,ii);

xint=a+(3*h/2):h:b-(3*h/2);
for i=1:numel(xint)
    yint(i)=lagrange_interp(xint(i),y,x,i+2);   
end

plot(x,y);
hold on;
plot(xint,yint,'s');
%lagrange interpolation





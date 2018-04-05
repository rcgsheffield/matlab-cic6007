function y=lagrange_interp(xval,y,x,i) 
%% langrange_interp - Using a series of points use an interpolating polynomial to
%  evaluate att a point xval
%  xval is the value of x at which we wish to interpolate
%  x and y are the series of points x with the value y at each of those
%  points
%%

    t1=(xval-x(i))*(xval-x(i+1))/((x(i-1)-x(i))*(x(i-1)-x(i+1)));
    t2=(xval-x(i-1))*(xval-x(i+1))/((x(i)-x(i-1))*(x(i)-x(i+1)));
    t3=(xval-x(i-1))*(xval-x(i))/((x(i+1)-x(i-1))*(x(i+1)-x(i)));
    y=t1*y(i-1)+t2*y(i)+t3*y(i+1);


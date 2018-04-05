function z = findZero(a,b,c,n)
% z = findZero(a,b,c) - Finds the root of the polynomial
% a*x^2 + b*x + c near n
z = fzero(@polynomial,n);
end

function y = polynomial(x)
y = a*x^2 + b*x + c;
end


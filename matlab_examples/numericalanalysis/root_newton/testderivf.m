function [dy] = testderivf(x)
% testf for root_newton_script and root_newton_function
% computes derivative of test function
% illustrates using function handles and differences between functions and
% scriptd
%   
dy = cos(2*(x-(pi/4)))+0.5*cos(x);

end


function [y] = testf(x)
% testf for root_newton_script and root_newton_function
% illustrates using function handles and differences between functions and
% scriptd
%   
y = 0.5.*sin(2.*(x-(pi/4)))+0.5.*sin(x);

end


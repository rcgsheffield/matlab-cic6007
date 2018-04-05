function A = makeA(m,n)
% MAKEA - General purpose matrix creation function
%
% A = MAKEA(m,n) creates an m x n matrix A for which
% the I, J th element is equal to I+J
%

for I = 1:m
   for J = 1:n
       A(I,J) = I+J;
   end
end

end

function X = GEPP( A )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[n, m] = size(A);

for k = 1:n-1
    [~,p] = max(abs(A(k:n,k)));
    p = p + k - 1;       
    A([k,p],:) = A([p,k],:);    
    A(k+1:n,k:m) = A(k+1:n,k:m) - ( A(k+1:n,k) ./ A(k,k) ) *  A(k,k:m);
end

X = A;
end


function [P,sgP] = LinApproximator(y,r,funcs)

% It is known, that for Linear LSquares the formula is
%   \beta = (X^t X)^{-1}X^t Y

M = size(funcs,2);
N = size(y,2);
K = size(r,1);

X = zeros(N,M);

for i=1:N
    for j=1:M
        X(i,j) = funcs{j}(r(:,i));
    end
end

Mat = inv(X' * X);
P = Mat  * X' * y';

S = norm(y' - X*P)^2;

sgP = S*diag(Mat)';

end
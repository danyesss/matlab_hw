function [P,sgP] = NonLinApproximator(y,r,fun, beta0)

% It is known, that for Linear LSquares the formula is
%   \beta = (X^t X)^{-1}X^t Y

N = size(y,2);
M = size(beta0,2);
K = size(r,1);

X = zeros(N,M);

% % Gauss-Newtonian method % %

delta = 1e-6;
Inf = 1000;
beta = beta0;

for it=1:Inf
    [f, J] = MultiFun(fun,r,beta);
%     disp(J);
%     disp(f);
%     disp(y');
    res = y' - f; 
    Mat = (J' * J) \ J'; % inversed
%     disp(it);
%     disp(Mat');
    d_beta = (Mat * res);
%     disp(d_beta);
    
    if sum(isnan(d_beta)) == 0
%         disp(beta);
        beta = beta + d_beta';  
        if max(abs(d_beta'./beta)) < delta
%             disp(abs(d_beta'./beta));
%             disp(it);
            break;
        end    
    else
        break;
    end
    
    
    
end

P = beta;
% disp(P);

S = norm(y' - f)^2;
sgP = S*diag(inv(J' * J))';

end
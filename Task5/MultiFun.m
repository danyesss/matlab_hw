function [f, J] = MultiFun(fun,r,beta)

K = size(r,1);
M = size(beta,2);
N = size(r,2);

f = zeros(N,1);
delta = 1e-6;
J = zeros(N,K);


for i=1:N
    f(i) = fun(r(:,i),beta);
    for j=1:M        
% Frankly, there is no way to calculate derivative of a function handle.
% However, approximately:
        O = zeros(1,M);
        if beta(j) ~= 0        
        O(j) = delta*abs(beta(j));
        beta1 = beta + O; betam1 = beta - O;
        J(i,j)=0.5*(fun(r(:,i),beta1)-fun(r(:,i),betam1))/O(j);
        else 
            O(j) = delta;
            beta1 = beta + O;
            J(i,j)=(fun(r(:,i),beta1)-f(i))/delta;
        end
    end
end
    
end


function [P,sgP] = LinApproximator_errors(y,r,sgy,sgr,funcs)
M = size(funcs,2);
N = size(y,2);
K = size(r,1);

X = zeros(N,M);

% finding delta for calculation derivatives
delta = zeros(K);
for i=1:K
    delta(i,i) = 0.01*max(abs(max(r(i,:))),abs(min(r(i,:))))/N;
end

% % Here, I'm using total-least-squares method
% derivatives:
D = zeros(M,K);
for i=1:K
    for j=i:M
        D(j,i) = (funcs{j}(r(:,i)+delta(:,i))+funcs{j}(r(:,i)-delta(:,i)))/(2*delta(i,i));
    end
end

% weights / covariance matrices:
My = zeros(N);
Mx = zeros(K);
for i=1:
    My(i,i) = sgy(i)^2;
end
for i=1:K
    Mx(i,i) = sgr(i)^2;
end
disp(Mx);
disp(D);

for i=1:N
    for j=1:M
        X(i,j) = funcs{j}(r(:,i));
    end
end

W = inv(My + D * Mx * D');
Mat = inv(X' * W * X);
P = Mat * X' * W * y;

%S = norm(y' - X*P)^2;
sgP = zeros(1,M);
%sgP = S*diag(Mat);

end
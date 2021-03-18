function Q = ElectroStaticBalls(XYZ,R,F) %Q = ElectroStaticBalls(XYZ,R,F)

N = size(R,2);

X = XYZ(1,:);
Y = XYZ(2,:);
Z = XYZ(3,:);

M = ones(N);

for i=1:N-1 
    M(i,i) = R(i);
    for j=i+1:N
        M(i,j) = norm(XYZ(:,i)-XYZ(:,j));
        M(j,i) = M(i,j);
    end
end

M = 1./M;

Q = linsolve(M,F);

% debus :
% disp(M);

end


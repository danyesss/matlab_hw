function Q = ElectroStaticBalls(XYZ,R,F) %Q = ElectroStaticBalls(XYZ,R,F)

N = size(R,2);

X = XYZ(1,:)';
Y = XYZ(2,:)';
Z = XYZ(3,:)';

M = ones(N);

XX = X*ones(1,N);
DX = XX-XX';

YY = Y*ones(1,N);
DY = YY-YY';

ZZ = Z*ones(1,N);
DZ = ZZ-ZZ';

M = sqrt(DX.^2 + DY.^2 + DZ.^2);

% R - on diagonal
Diag = eye(N).*kron( ones(N,1)',R');
M = M + Diag;

M = 1./M;

% 
% for i=1:N-1 
%     M(i,i) = R(i);
%     for j=i+1:N
%         M(i,j) = norm(XYZ(:,i)-XYZ(:,j));
%         M(j,i) = M(i,j);
%     end
% end

Q = linsolve(M,F);

% debus :
% disp(M);

end


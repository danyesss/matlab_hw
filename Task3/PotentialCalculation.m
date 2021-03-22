function F = PotentialCalculation(XYZ, R, Q, r0) % [F,X,Y,P] = SphereDipPotential(XYZ,Q,D,R,r0,a,b,Dx,Dy,Nxy);

N = size(R,2);

X = XYZ(1,:);
Y = XYZ(2,:);
Z = XYZ(3,:);

M = zeros(1,N);

xyz = r0*ones(1,N) - XYZ;

for j=1:N        
    % xyz = r0 - XYZ(:,j);
    if norm(xyz(:,j)) > R(j)
     % charge potential and field :
        M(1,j) = 1./norm(xyz(:,j));
    else
        M(1,j) = 1/R(j);
    end
end

F = M*Q;

end


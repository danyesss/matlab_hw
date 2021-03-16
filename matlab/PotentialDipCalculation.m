function F = PotentialDipCalculation(XYZ,R,Q,D,r0) % [F,X,Y,P] = SphereDipPotential(XYZ,Q,D,R,r0,a,b,Dx,Dy,Nxy);

N = size(R,2);

X = XYZ(1,:);
Y = XYZ(2,:);
Z = XYZ(3,:);

M = zeros(1,4*N);

x0 = r0(1);
y0 = r0(2);
z0 = r0(3);

    for j=1:N        
        xyz = r0 - XYZ(:,j);
        % charge potential and field :
        M(1,j) = 1./norm(xyz);        
        M3 = M(1,j)^3;
        % dipole potential :
        M(1,N + j) = xyz(1)*M3;
        M(1,2*N + j) = xyz(2)*M3;
        M(1,3*N + j) = xyz(3)*M3;
    end
    
Q_expanded = [Q;D];

F = M*Q_expanded;

end


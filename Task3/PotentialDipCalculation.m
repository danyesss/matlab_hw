function F = PotentialDipCalculation(XYZ,R,Q,D,r0) % [F,X,Y,P] = SphereDipPotential(XYZ,Q,D,R,r0,a,b,Dx,Dy,Nxy);

N = size(R,2);

X = XYZ(1,:);
Y = XYZ(2,:);
Z = XYZ(3,:);

M = zeros(1,4*N);

x0 = r0(1);
y0 = r0(2);
z0 = r0(3);


xyz = r0*ones(1,N) - XYZ;

for j=1:N        
   if norm(xyz(:,j)) > R(j)
        % charge potential and field :
        M(1,j) = 1./norm(xyz(:,j));        
        M3 = M(1,j)^3;
        % dipole potential :
        M(1,N + j) = xyz(1,j)*M3;
        M(1,2*N + j) = xyz(2,j)*M3;
        M(1,3*N + j) = xyz(3,j)*M3;
   else
        M(1,j) = 1/R(j);
        % M3 = M(1,j)^3;            
   end        
end

D = [D(:,1);D(:,2);D(:,3)];
Q_expanded = [Q;D];

F = M*Q_expanded;

end


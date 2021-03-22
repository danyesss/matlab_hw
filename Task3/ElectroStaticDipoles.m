function [Q,D] = ElectroStaticDipoles(XYZ,R,F) % [F,X,Y,P] = SphereDipPotential(XYZ,Q,D,R,r0,a,b,Dx,Dy,Nxy);

N = size(R,2);

X = XYZ(1,:);
Y = XYZ(2,:);
Z = XYZ(3,:);

M = zeros(4*N);

for i=1:N 
    % M(i - field potential and field, j - charges and dipoles) % Matrix 4N x 4N
    % i=1:N - field potential
    % j=1:N - charges 
    
    M(i,i) = R(i);
    M(N + i,N + i) = -1./R(i)^3;
    M(2*N + i,2*N + i) = M(i,N + i);
    M(3*N + i,3*N + i) = M(i,N + i);
    
    M(N + i,N + i) = -1./R(i)^3;
    M(2*N + i,2*N + i) = M(N + i,N + i);
    M(3*N + i,3*N + i) = M(N + i,N + i);
    
    % i=2N:4N - field (2N + i 3N + i 4N + i - dipole components)
    % j=2N:4N - dipoles (2N + i 3N + i 4N + i - dipole components)
   
    for j=i+1:N
        xyz = XYZ(:,i)-XYZ(:,j);
        x = xyz(1);
        y = xyz(2);
        z = xyz(3);
        
        % charge potential and field :
        M(i,j) = 1./norm(xyz);
        M3 = M(i,j)^3;
        
        M(N + i,j) = (x)*M3;
        M(2*N + i,j) = (y)*M3;
        M(3*N + i,j) = (z)*M3;
        
        M(j,i) = M(i,j);
        M(N + j,i) = -M(N + i,j);
        M(2*N + j,i) = -M(2*N + i,j);
        M(3*N + j,i) = -M(3*N + i,j);
        
        % dipole potential :
        M(i,N + j) =  M(N + i,j);
        M(i,2*N + j) = M(2*N + i,j);
        M(i,3*N + j) = M(3*N + i,j);
        
        M(j,N + i) =  -M(N + i,j);
        M(j,2*N + i) = -M(2*N + i,j);
        M(j,3*N + i) = -M(3*N + i,j);
        
        % dipole field :
        M52 = M(i,j)^(5/2);
        M(N + i, N + j) = (2*x^2 - y^2 - z^2)*M52;
        M(N + i, 2*N + j) = 3*x*y*M52;
        M(N + i, 3*N + j) = 3*x*z*M52;
        
        M(2*N + i, N + j) = 3*x*y*M52;
        M(2*N + i, 2*N + j) = (2*y^2 - x^2 - z^2)*M52;
        M(2*N + i, 3*N + j) = 3*y*z*M52;
        
        M(3*N + i, N + j) = 3*x*z*M52;
        M(3*N + i, 2*N + j) = 3*z*y*M52;
        M(3*N + i, 3*N + j) = (2*z^2 - x^2 - y^2)*M52;
        % symmetry :                
        M(N + i, N + j) =  M(N + j, N + i);
        M(N + i, 2*N + j) = M(N + j, 2*N + i);
        M(N + i, 3*N + j) = M(N + j, 3*N + i);
        
        M(2*N + i, N + j) =  M(2*N + j, N + i);
        M(2*N + i, 2*N + j) = M(2*N + j, 2*N + i);
        M(2*N + i, 3*N + j) = M(2*N + j, 3*N + i);
        
        M(3*N + i, N + j) =  M(3*N + j, N + i);
        M(3*N + i, 2*N + j) = M(3*N + j, 2*N + i);
        M(3*N + i, 3*N + j) = M(3*N + j, 3*N + i);        
    end
end

F_expanded = [F;zeros(3*N,1)];

% disp("F_expanded: ")
% disp(F_expanded);
% 
% disp("Matrix: ")
% disp(M);

Q_expanded = linsolve(M,F_expanded);

Q = Q_expanded(1:N);
DD = Q_expanded(N+1:4*N);

%disp(DD);

D = [DD(1:N),DD(N+1:2*N),DD(2*N+1:3*N)];

% disp(Q);
end


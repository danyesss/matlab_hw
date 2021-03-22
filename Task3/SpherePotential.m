function[F,X,Y,P] = SpherePotential(XYZ,Q,R,r0,a,b,Dx,Dy,Nxy)


Check = Correctness(XYZ,R);

[X,Y,P] = Rotation(a,b,Dx,Dy,Nxy);

Grid = ones(3,Nxy(1),Nxy(2));
Grid(1,:,:) = Grid(1,:,:)*r0(1); 
Grid(2,:,:) = Grid(2,:,:)*r0(2);
Grid(3,:,:) = Grid(3,:,:)*r0(3);

for i=1:Nxy(1)
    for j=1:Nxy(2)
    Grid(:,i,j) = Grid(:,i,j)+P*[X(i,j);Y(i,j)];
%     disp("PXY:");
%     disp(P*[X(i,j);Y(i,j)]);
    end
end
% 
% XX = Grid(2,:,:);
% YY = Grid(1,:,:);
% 
% disp("Grid Y:");
% disp(YY);
% disp("and X");
% disp(XX);

F = zeros(Nxy);

for i=1:Nxy(1)
    for j=1:Nxy(2)
        r1 = Grid(:,i,j);
%         disp("r1")
%         disp(r1);
        F(i,j) = PotentialCalculation(XYZ, R, Q, r1);
    end
end
%disp(F);
end
    
function[F,X,Y,P] = SphereDipPotential(XYZ,Q,D,R,r0,a,b,Dx,Dy,Nxy)

Check = Correctness(XYZ,R);

if Check == 1

[X,Y,P] = Rotation(a,b,Dx,Dy,Nxy);

Grid = ones(3,Nxy(1),Nxy(2));
Grid(1,:,:) = Grid(1,:,:)*r0(1); 
Grid(2,:,:) = Grid(2,:,:)*r0(2);
Grid(3,:,:) = Grid(3,:,:)*r0(3);

for i=1:Nxy(1)
    for j=1:Nxy(2)
    Grid(:,i,j) = Grid(:,i,j)+P*[X(i,j);Y(i,j)];
    end
end

for i=1:Nxy(1)
    for j=1:Nxy(2)
        r1 = Grid(:,i,j);
        F(i,j) = PotentialDipCalculation(XYZ, R, Q, D, r1);
    end
end

else 
    disp("Balls intersections aren't allowed!!!")
    F = NaN;
   % hi!;
end
%disp(F);
end
    
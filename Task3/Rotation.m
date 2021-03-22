function [X, Y, P] = Rotation(a, b, Dx, Dy, Nxy)
%ROTATION Summary of this function goes here
%   Detailed explanation goes here
e1 = a/norm(a);
e2 = b - (e1(1)*b(1) + e1(2)*b(2) + e1(3)*b(3));

% Nxy(1)--Y; Nxy(2)--X;

DY = Dy(2)-Dy(1);
DX = Dx(2)-Dx(1);

dy = DY/(Nxy(1)-1);
dx = DX/(Nxy(2)-1);

X = zeros(Nxy(1),Nxy(2));
Y = zeros(Nxy(1),Nxy(2));

for i=1:Nxy(1)
    for j=1:Nxy(2)
        Y(i,j) = Dy(1)+(i-1)*dy;
        X(i,j) = Dx(1)+(j-1)*dx;
    end
end

% disp("X,Y:")
% disp(X);
% disp(Y);

P = [e1, e2];

end


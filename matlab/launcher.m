           % Checklist %
% to write no intersections check V
% to write function for field calculation V
% to write funciton with analytical geometry and plane rotations V

clear all;

        % Workspace description : %

% 'data.txt' - file with data for system's characteristics calculation - D
% & Q.
%   first 3 columns - charges' coordinates;
%   4th column - Radia
%   5th column - Potential

data = dlmread('data.txt');

XYZ = data(:,1:3);
R = data(:,4);
F = data(:,5);

R = R';
XYZ = XYZ';

Q1 = ElectroStaticBalls(XYZ, R, F);
disp(Q1);

[Q2,D] = ElectroStaticDipoles(XYZ, R, F);
disp(Q2);

% Points parameters should be written manually beyond ->

a = [1,1,1]';
b =[1,1,3]';
Dx = [-2,2];
Dy = [-2,2];
Nxy = [5 5];

r0 = [0,0,3];

[F1,X,Y,P] = SpherePotential(XYZ,Q1,R,r0,a,b,Dx,Dy,Nxy);
disp(F1);

[F2,X,Y,P] = SphereDipPotential(XYZ,Q1,D,R,r0,a,b,Dx,Dy,Nxy);
disp(F2);
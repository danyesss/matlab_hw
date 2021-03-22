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

%data = dlmread('data.txt');

% 
% a = [1,0,0]';
% b =[0,1,0]';
% Dx = [-10,10];
% Dy = [-10,10];
% Nxy = [50 50];
% 
% r0 = [0,0,0];

load('./data/Cube_quadr_1.mat');

R = R';
XYZ = XYZ';

% Q1 = ElectroStaticBalls(XYZ, R, F);
% disp(Q1);
% 
[Q2,D] = ElectroStaticDipoles(XYZ, R, F);
% disp(Q2); disp(D);


% [F1,X,Y,P] = SpherePotential(XYZ,Q1,R,r0,a,b,Dx,Dy,Nxy);
% disp(F1);
% 
% surf(X,Y,F1);
% shading interp
% camlight

% assymmetry in data ???

[F2,X,Y,P] = SphereDipPotential(XYZ,Q2,D,R,r0,a,b,Dx,Dy,Nxy);
%disp(F2);

surf(X,Y,F2);
shading interp
camlight
% plot3(X(:),Y(:),F2);

%why the same ??? 

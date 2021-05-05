%  funcs= {@(x)x, @(x)1};
%  r = [1,2,3,4,5];
%  y = [1,2,2.99,4,5];
%  
%  [P,sgP] = LinApproximator(y,r,funcs);
%  
%  disp(P);
%  disp(sgP);
 
%  
 
clear all; close all;
% fun = @(r,P)P(1).*exp(-P(2).*r(1))+P(3);
% 
% r = [1,1.1,1.2,1.3;1,1.1,1.2,1.3];
% y = [1,2,6,15];
% beta0 = [1,1,1];

% fun = @(r,P) P(1)*r.^2+ P(2);
% r = [0, 1, 2, 3, 4, 5];
% y = [0,1.1,4.1,8.5,15.8,27];
% beta0 = [5,5];

fun = @(r,P) P(2)*sin(P(1)*r);
r = [0, pi/6, pi/3, pi/2, 2*pi/3,pi];
y = [0,0.5, 0.9,1.1,0.8,0];
beta0 = [1,1.1];

% fun = @(r,P) P(1)*r(1).^2 - P(2)*r(2).^2;
% r = [0, 0;
%     0, 1.01;
%     1, 0;
%     0, -0.99;
%     -0.98, 0;
%     1.01, 0.98;
%     1, -0.9;
%     -1.1, 1;
%     -1, -1.1]';
% y = [0, -1, 1, -1, 1, 0,  0, 0, 0];
% beta0 = [0.9,1.1];
% % plot3(r(:,1),r(:,2),y,'bo');


[P,sgP] = NonLinApproximator(y,r,fun,beta0);
disp(P);
disp(sgP);
% times = linspace(min(r),max(r),100)';
% ytimes = zeros(size(times,1),1);


% hold on;
% plot(times,fun(times,P),'k--');

  
clear all; close all; 
funcs= {@(x)x, @(x)1};
 r = [1,2,3,4,5];
 y = [1,2,2.99,4,5];
 
 
 sgr = [0.1,0.1,0.1,0.1,0.1];
 sgy = [0.1,0.1,0.1,0.1,0.1];
 
  %[P,sgP] = LinApproximator(y,r,funcs);
  [Pe,sgPe] = LinApproximator_errors(y,r,sgy,sgr,funcs);
%  
  disp(Pe);
  disp(sgPe);
 
%  
xtimes = linspace(min(r),max(r),100);
plot(r,y,'bo');
hold on;
plot(xtimes,P(1)*funcs{1}(xtimes) + P(2)*funcs{2}(xtimes),'k-')

% fun = @(r,P)P(1).*exp(-P(2).*r(1))+P(3);
% 
% r = [1,1.1,1.2,1.3;1,1.1,1.2,1.3];
% y = [1,2,6,15];
% beta0 = [1,1,1];
% 
% [P,sgP] = NonLinApproximator(y,r,fun,beta0);
% 
%  hold off;
%  plot3(r(1,:),r(2,:),y,'ko');
%  hold on;
%  
%  times = linspace(1,1.2,100)';
%  ytimes = zeros(size(times,1),1);
 
%  for i=1:size(times,1)
%  ytimes(i) = fun(times(i),P);
%  end 
% 
%  plot3(times,times,ytimes,'b--');
 
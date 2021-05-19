function [Fr,Dr] = VibraStates(xyz,q,m,k)
% % xyz - матрица 3xN с координатами N ядер в положениях равновесия
% % q   -  строка 1xN со значениями эффективного заряда на ядре 
% % m   -  строка 1xN со значениями масс ядер
% % k   -  матрица 4xM парных упругих связей.
% % В первой и второй строках матрицы заданы номера ядер из xyz
% % , в третьей строке - значение коэффициента упругости для данной пары ядер,
% % а в четвёртой - значения равновесных расстояний при отсутствии влияния электростатики.

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

N = size(q,2);
e0 = -4.8032e-10; % CGS units

% Force equilibrium %

flag = 1;

F0 = 0;
for i=1:N
    F = 0;
    array = find(k(1,:)==i);
    for j=[1:i-1, i+1:N] % how about improving Force function ???
%             if j > i
%                 jj = (N-1)*(i-1) + j - 1;
%             else
%                 jj = (N-1)*(i-1) + j;
%             end            
            jj = find(k(2,array)==j);
            
            rvec = xyz(:,j)-xyz(:,i);
            r = norm(rvec);
            r0 = k(4,jj);
            k0 = k(3,jj);
            
            dF = 1e1 *e0*k0*(r - r0)*rvec./r + 1e16 * q(i)*q(j)*e0^2*rvec*r^(-3);
            F = F + dF;
            if i == 1
                F0 = F0 + norm(dF);
            end
    end
    
    if norm(F) > .01*F0
       flag = 0;
       break;
    end
    
    disp(F);
    
end
    
% if flag == 0
%     return 0; % ????
%     break;
% end

% % % % % % % % % % % % % % % % % % % % % % % 

% Normal frequencies :
Mat = zeros(3*N);

ex = [1,0,0]'; ey = [0,1,0]'; ez = [0,0,1]';

for i=1:N
    array = find(k(1,:)==i);
    for j=[1:i-1, i+1:N]
%         jj = (N-1)*(i-1) + j;
        jj = find(k(2,array)==j);
        
        rvec = xyz(:,j)-xyz(:,i);
        r = norm(rvec);
        r0 = k(4,jj);
        k0 = k(3,jj);
        
       % disp(1e1 *e0*k0*(ex*(1-r0/r) + rvec(1) * r0 * rvec /r^3 ) + 1e16 * q(i)*q(j)*e0^2*(ex/r^3 - 3*rvec(1)*rvec/r^5));
        Mat(3*i + 1:3*i + 3, 3*j + 1) =  1e1 *e0*k0*(ex*(1-r0/r) + rvec(1) * r0 * rvec /r^3 ) + 1e16 * q(i)*q(j)*e0^2*(ex/r^3 - 3*rvec(1)*rvec/r^5); 
        Mat(3*i + 1:3*i + 3, 3*j + 2) =  1e1 *e0*k0*(ey*(1-r0/r) + rvec(2) * r0 * rvec /r^3 ) + 1e16 * q(i)*q(j)*e0^2*(ey/r^3 - 3*rvec(2)*rvec/r^5);
        Mat(3*i + 1:3*i + 3, 3*j + 3) =  1e1 *e0*k0*(ez*(1-r0/r) + rvec(3) * r0 * rvec /r^3 ) + 1e16 * q(i)*q(j)*e0^2*(ez/r^3 - 3*rvec(3)*rvec/r^5);
        
        Mat(3*i + 1:3*i + 3, j + 1 : j + 3) = 1/m(i) * Mat(3*i + 1:3*i + 3, j + 1 : j + 3);
        
    end
       Mat(3*i + 1:3*i + 3, 3*i + 1) =  zeros(3,1);
       Mat(3*i + 1:3*i + 3, 3*i + 2) =  zeros(3,1);
       Mat(3*i + 1:3*i + 3, 3*i + 3) =  zeros(3,1);
end

[V, D] = eig(Mat);
D = diag(D);

nsmall = size(find(D==0),1);
array = find(D==0);
for i = 1:nsmall
    D(array(i)+1-i) = [];
    V(:,array(i)+1-i) = [];
end
% D(D==0) = [];

%disp(D);

Fr = sqrt(D)';
Dr = V;

% что удалять ?))

% % Fr  - строка 1x(3N-6) 
% % со значениями частот собственных колебаний 
% % Dr - матрица 3Nx(3N-6)
% % со значениями компонент векторов амплитуд смещения ядер из положений равновесия для каждого колебательного состояния.
end

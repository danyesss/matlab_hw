clear all; close all;
% % xyz - матрица 3xN с координатами N ядер в положениях равновесия
% % q   -  строка 1xN со значениями эффективного заряда на ядре 
% % m   -  строка 1xN со значениями масс ядер
% % k   -  матрица 4xM парных упругих связей.
% % В первой и второй строках матрицы заданы номера ядер из xyz
% % , в третьей строке - значение коэффициента упругости для данной пары ядер,
% % а в четвёртой - значения равновесных расстояний при отсутствии влияния электростатики.

xyz = [0, 0, 0; 1, 1, 1; 0, 0, 1; 1, 0, 0]';
q = [1, 1, 1, 1];
m = [1, 1, 1, 1];
k = [1, 2, 1, 2;
    1, 3, 1, 2;
    1, 4, 1, 2;
    2, 1, 1, 2;
    2, 3, 1, 2;
    2, 4, 1, 2;
    3, 1, 1, 2;
    3, 2, 1, 2;
    3, 4, 1, 2;
    4, 1, 1, 2;
    4, 2, 1, 2;
    4, 3, 1, 2;]';

[Fr, Dr] = VibraStates(xyz,q,m,k);

disp(Fr);

% T = [1e-15:1e-15:1e-12]';

T = [1e-14:1e-14:1e-12]';

Cv = SpecificHeatVib(Fr, T);

disp(Cv);

plot(T, Cv, 'b-');

I = IR_Spectra(Fr, Dr, q, m, T);

% disp(I);
plot(T,I);


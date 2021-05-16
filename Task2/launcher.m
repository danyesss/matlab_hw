clear all; close all;
m = 9.109383701528 * 10^(-31);
U_0 = -4;
Emax = 26;
a = 0.5*10^(-9);
b = 2*10^(-9);
h = 1.054571817 * 10^(-34);
k = [-pi/(a + b):0.01/(a + b):pi/(a + b)];


E = KronigPenney(k, m, a, b, U_0, Emax);
plot(k,E);
grid on
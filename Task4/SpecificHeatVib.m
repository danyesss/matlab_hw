function Cv = SpecificHeatVib(Fr,T)
% % T - вектор значений температуры (в K) в которой необходимо вычислить колебательную  теплоёмкость
% % Cv - вектор значений темлоёмкости молекулы (в эВ/К) для заданных температур.
% % Fr  - строка 1x(3N-6) со значениями частот собственных колебаний 

%N = size(q,2);  
h = 1.05457e-27; % Erg * s % h_bar
k = 1.380649e-16; % Erg / K

% E =@(f, T) h.*f.*(1/2 + 1./(exp(h.*f/(k*T))-1));
Capacity = @(w, T) (exp((h .*w)./(k .* T)) * h^2 .* w.^2)./((-1 + exp((h .*w)./(k .* T))).^2 * k .* T.^2);

Cv = zeros(size(T,1),1);
CC = zeros(size(T,1),size(Fr,2));

%CC = Capacity(Fr(end),T);
%plot(T,exp((h .*Fr(end))./(k .* T)));


% disp(1./(-1 + exp((h .*Fr(end))./(k .* T))));
% 
% plot(T, T.^(-2)./((-1 + exp((h .*Fr(end))./(k .* T))).^2));


for i=1:size(T,1)
    C = Capacity(Fr, T(i));
    CC(i,:)= C;
    
    C = rmmissing(C);
   % disp(C);
    Cv(i) = real(sum(C));
end

plot(T,CC);

end

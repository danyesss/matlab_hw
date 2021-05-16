function [E] = KronigPenney(k, m, a, b, U, Emax)

% Some fundamental constants:
h = 1.054571817 * 10^(-34);
e_0 = 1.602176634 * 10^(-19);

% Used functions :
function F1 = fun1(curE)
    curE = curE .* e_0;
    mu = sqrt(2*m.*curE/(h*h));
    lambda = sqrt(2*m.*(curE - U_0)/(h*h));
    F1 = cos(mu.*a).*cos(lambda.*b)-(lambda.^2+mu.^2)./(2*mu.*lambda).*(sin(mu*a).*sin(lambda.*b));
end

function  F = fun(curE)
    F = fun1(curE) - cos(curk*(a+b));
end

fn = @fun;
fn1 = @fun1;

% For such step it works
E = [U:0.001*abs(Emax-U):Emax];

U_0 = U .* e_0;
y = E;

% Finding intervals between function extremums :
for jj = 1:(length(E))
    y(jj) = fn1(E(jj));
end

der = diff(y)./diff(E);
len = length(der);
extr = U+0.0001*abs(Emax-U);
for ii = 1:(len - 1)
    if der(ii) * der(ii + 1) < 0
        extr = [extr, E(ii+1)];
    end  
end

points = extr;

% Finding solutions of cos(...) == F1(E) equation :
lenk = length(k); lene = length(points);
E = zeros(lene, lenk);
for jj = 1:(lene-1)
    intervalE = [points(jj) points(jj + 1)];
    for ii = 1:lenk
        curk = k(ii);  
        E(jj,ii) = fzero(fn, intervalE);
    end
end

end
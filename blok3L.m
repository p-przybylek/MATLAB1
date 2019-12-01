function x = blok3L(L, b)
% blok3 Rozwiazuje uklad rownan L*x=b, gdzie:
%   L to blokowo macierz 3 na 3 dolnotrojkatna z wartoscia L31 = 0,
%   b to wektor tej samej wielkosci, co L.

[m, n] = size(L);
if(m ~=n)
    disp("Podana macierz L nie jest kwadratowa!")
    throw(exception)
end

if(mod(n, 3) ~= 0)
    disp("Podana macierz L nie jest wielkosci wielokrotnosci 3!")
    throw(exception)
end

p = n/3; % p to integer, bo sprawdzilem

m = length(b);
if(m ~=n)
    disp("Podany wektor b nie jest tej samej wielkosci, co wektor A!")
    throw(exception)
end

x = zeros(n, 1);
x(1:p) = GEPPp(L(1:p, 1:p), b(1:p)); % pierwsze p rownan
x((p+1):(2*p)) = GEPPp(L((p+1):(2*p),(p+1):(2*p)), b((p+1):(2*p)) - L((p+1):(2*p), 1:p)*x(1:p)); % nastepne, srodkowe p rownan. od prowiazania srodkowego odejmujemy to z lewej strony % ToDo opisac to ladnie, w papierze musi to byc jasne, to jest trudne
x((2*p+1):(3*p)) = GEPPp(L((2*p+1):(3*p),(2*p+1):(3*p)), b((2*p+1):(3*p)) - L((2*p+1):(3*p), (p+1):(2*p))*x((p+1):(2*p)));

end








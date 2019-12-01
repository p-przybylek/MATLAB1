function x = blok3U(U, b)
% blok3 Rozwiazuje uklad rownan U*x=b, gdzie:
%   U to blokowo macierz 3 na 3 gornotrojkatna z wartoscia L31 = 0,
%   b to wektor tej samej wielkosci, co U.

[m, n] = size(U);
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
x((2*p+1):(3*p)) = b((2*p+1):(3*p));
x((p+1):(2*p)) = b((p+1):(2*p)) - U((p+1):(2*p), (2*p+1):(3*p)) * x((2*p+1):(3*p));
x(1:p) = b(1:p) - U(1:p, (p+1):(2*p)) * x((p+1):(2*p));

end








function [A, b, condA11] = losoweA(n)
% losoweA dostaje liczbe naturalna n = 3*p i buduje macierz
%   postaci A = [A11, A12, zeros(p); A12', A11, A23; zeros(p), A23', A11]
%   gdzie Aij jest wymiaru pxp, a A11 jest ortogonalna
% Jesli chcemy, jako druga wartosc moze zwrocic wektor
%   losowych liczb o wysokosci n
% dodatkowo mozliwe jest zwrocenie wyniku sprawdzajacego popranosci przyblizenia A11 do macierzy ortogonalnej (condA11)

if(mod(n, 3) ~= 0)
    disp("Podany n nie jest wielokrotnoscia 3!")
    throw(exception)
end

p = n/3; % na pewno moge, bo sprawdzilem

if(nargout > 1) % jesli uzytkownik chce miec b
    b = randn(n,1);
end

A12 = randn(p);
A23 = randn(p);
[A11,~] = qr(randn(p)); % ~ oznacza, ze nie chcemy zapisywac tego

if(nargout == 3) % jak dobrze macierz A11 przybliza macierz ortogonalna
    condA11 = norm(A11*A11' - eye(p));
end

A = [A11, A12, zeros(p); A12', A11, A23; zeros(p), A23', A11];

end


function [A, b] = losoweA(n)
%losoweA dostaje liczbe naturalna n = 3*p i buduje macierz
%   postaci A = [A11, A12, zeros(p); A12', A11, A23; zeros(p), A23', A11]
%   gdzie Aij jest wymiaru pxp, a A11 jest ortogonalna
%Jesli chcemy, jako druga wartosc moze zwrocic wektor
%   losowych liczb o wysokosci n

if(mod(n, 3) ~= 0)
    disp("Podany n nie jest wielokrotnoscia 3!")
    throw(exception)
end

p = n/3; %na pewno moge, bo sprawdzilem

if(nargout > 1) % jesli urzytkownik chce miec b
    b = randn(n,1);
end

A12 = randn(p);
A23 = randn(p);
[A11,~] = qr(randn(p)); % ~ oznacza, ze nie chcemy zapisywac tego
% ToDo policzyc norm(A11*A11' - eye(p)), powinno byc bardzo male

A = [A11, A12, zeros(p); A12', A11, A23; zeros(p), A23', A11];
end


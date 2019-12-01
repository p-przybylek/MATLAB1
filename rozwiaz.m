function [x, e_dec] = rozwiaz(A,b)
% funckja rozwiaz przyjmuje macierz A oraz wektor b
    % i rozwiazuje A*x=b

[L, U] = CroutPartition(A);
y = blok3L(L, b);
x = blok3U(U, y);

if(nargout == 2) % tylko gdy uzytkownik chce
    e_dec = norm(A-L*U)/norm(A); % blad rozkladu
end

end


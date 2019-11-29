function x = TEST_Dzialania(A,b)
% TEST_Dzialania Przyjmuje macierz A oraz wektor b
    % i rozwiazuje A*x=b

p = size(A);
[L, U] = CroutPartition(A, p(1)/3);
y = blok3L(L, b);
x = blok3U(U, y);


end


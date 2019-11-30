function x = TEST_Dzialania(A,b)
% TEST_Dzialania Przyjmuje macierz A oraz wektor b
    % i rozwiazuje A*x=b

[L, U] = CroutPartition(A);
y = blok3L(L, b);
x = blok3U(U, y);


end


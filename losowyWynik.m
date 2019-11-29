function [A,b,x,xMATLAB] = losowyWynik(p)
%losowyWynik przyjmuje liczbe p i losuje macierz A wielkosci 3*p
%   oraz rozwiazuje ja
[A, b] = losoweA(3*p);
x = TEST_Dzialania(A, b);
xMATLAB = A\b;

end


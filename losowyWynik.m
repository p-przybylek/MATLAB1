function [A,b,x, condA, e_dec, wsp_poprX, wsp_poprXmatlab] = losowyWynik(p)
% losowyWynik przyjmuje liczbe p i losuje macierz A wielkosci 3*p
%   oraz rozwiazuje ja
% dodatkowo mozliwym jest zwrocenie listy skladajacej sie z cond(A), bledu
% rozkladu, wspolczynnikow poprawnosci dla x naszego i matlabowego 

[A, b] = losoweA(3*p);
[x, e_dec] = rozwiaz(A, b); % zwracamy x oraz blad rozkladu
xMATLAB = A\b;

if(nargout > 3)
    condA = cond(A); % uwarunkowanie A
    wsp_poprX = norm(b-A*x)/(norm(A)*norm(x)); % wspolczynnik poprawnosci dla naszego x
    wsp_poprXmatlab = norm(b-A*xMATLAB)/(norm(A)*norm(xMATLAB)); % wspolczynnik poprawnosci dla x matlabowego
    %sprawdzenie = [condA, e_dec, wsp_poprX, wsp_poprXmatlab];
end

end

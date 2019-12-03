function  [condA, e_dec, e_rel, wsp_stab, wsp_poprX] = dokladnyWynik(A, z)
% funkcja przyjmuje z ktory ma byc dokladnym rozwiazaniem A*x=b oraz A
% wyznaczamy b, a nastepnie x, ktory jest rozwiazaniem naszego algorytmu
% zwracamy wszelkie wyliczone bledy, wspolczynniki i uwarunkowania

[p,q] = size(z);
if(q ~= 1)
    disp("Podany z nie jest wektorem p na 1, gdzie p to jakas liczba naturalna.")
    throw(exception)
end

[m, n] = size(A);
if(m ~=n)
    disp("Podana macierz A nie jest kwadratowa!")
    throw(exception)
end

if(p ~= m)
    disp("Zle wymiary A i z")
    throw(exception)
end

b = A*z;
[x, e_dec] = rozwiaz(A, b);

condA = cond(A); % uwarunkowanie A
e_rel = norm(x - z)/norm(z); % blad wzgledny
wsp_stab = e_rel/cond(A); % wspolczynnik stabilnosci
wsp_poprX = norm(b-A*x)/(norm(A)*norm(x)); % wspolczynnik poprawnosci dla naszego x
% sprawdzenie = [condA, e_dec, e_rel, wsp_stab, wsp_poprX];

end
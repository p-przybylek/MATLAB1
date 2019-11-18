function x = GEPPp(B,b)
%GEPPp Przyjmuje macierz B[p na p] bez dodatkowcy zalozen
%   i kolumne b dlugosci b.
%Stosujac metode GEPP wyznacza taki x, ze Bx=b

[m, p] = size(B);
if(m ~=p)
    disp("Podana macierz B nie jest kwadratowa!")
    throw(exception)
end
m = length(b);
if(m ~=p)
    disp("Podany wektor b nie jest tego samego wymiaru, co macierz B!")
    throw(exception)
end

r = 1:p; % wektor permutacji
r = r';



x = zeros(p, 1); % rozwiazanie
for k=1:p
    % szukanie elementu najwiekszego od k-tego do p-tego
    max = abs(B(r(k), r(k)));
    max_pozycja = k;
    for l = k:p
        if abs(B(r(l), r(k))) > max            
            max = abs(B(r(l), r(k)));            
            max_pozycja = l;            
        end
    end
    
    % zamienmy wiersze: k z max_pozycja
    stary_r = r;
    r(k) = stary_r(max_pozycja);
    r(max_pozycja) = stary_r(k);
    
    % eliminacja wierszy ponizej k-tego
    for i = (k+1):p
        alpha = B(r(i), k) / B(r(k), k);
        for j = k:p % dzialanie na calym wierszu
            B(r(i), j) = B(r(i), j) - B(r(k), j) * alpha;
        end
        b(r(i)) = b(r(i)) - b(r(k)) * alpha;
    end
end

% teraz B z odpowiednia permutacja to macierz gornotrojkatna

% TODO dodac algorytm od Pauliny

end















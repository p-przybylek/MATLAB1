function X = GEPPM(B,M)
%GEPPp Przyjmuje macierz B[p na p] bez dodatkowcy zalozen
%   i macierz M[p na p].
%Stosujac metode GEPP wyznacza macierz X, ze B*X=M

[m, p] = size(B);
if(m ~=p)
    disp("Podana macierz B nie jest kwadratowa!")
    throw(exception)
end
[n, p] = size(M);
if(n ~=p)
    disp("Podana macierz M nie jest kwadratowa!")
    throw(exception)
end
if(m ~=n)
    disp("Podane macierze B i M nie sa tej samej wielkosci!")
    throw(exception)
end


r = 1:p; % wektor permutacji
r = r';

X = zeros(p); % rozwiazanie
for k=1:p
    % szukanie elementu najwiekszego od k-tego do p-tego
    max = abs(B(r(k), k));
    max_pozycja = k;
    for l = k:p
        if abs(B(r(l), k)) > max            
            max = abs(B(r(l), k));            
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
        % dzialania na calym wierszu
        for j = k:p % Macierz B wystarczy, ze bedzie zmieniana od k do p
            B(r(i), j) = B(r(i), j) - B(r(k), j) * alpha;
        end
        for j = 1:p % Macierz M musi byc zmieniona cala
            M(r(i), j) = M(r(i), j) - M(r(k), j) * alpha;
        end
    end
end

% teraz B z odpowiednia permutacja to macierz gornotrojkatna


U = B(r(1:p),1:p);
M_nowa = M(r(1:p),1:p);
% ToDo rozwiazanie U*X = M_nowa
X = U\M_nowa;






% ToDo norm(GEPPM(B, M) - (B\M)) dla randomowych maciorek

end










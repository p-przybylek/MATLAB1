function [L,U] = CroutPartition(A,p) 
% funkcja zwraca rozklad blokowy LU macierzy A
% przyjmuje ona macierz A i liczbe naturalna p, ktora wyznacza podzial na bloki

[m,n] = size(A);
if m ~= n 
    disp('Podana macierz A nie jest kwadratowa!')
    return
end

if rem(n,3) ~= 0
     disp('Macierz A jest zla macierza wejsciowa, poniewaz n != 3*p, gdzie n, p naturalne, a n na n to wymiar A')
    return
end

% dzielimy A na bloki
A12 = A(1:p,p+1:2*p);
A23 = A(p+1:2*p,2*p + 1: 3*p);

% liczymy bloki L i U
	L11 = A(1:p, 1:p); % Wiemy, ze cond(A11) == 1, bo jest to macierz ortogonalna
	U12 = L11' * A12; % L11*U12 = A12, wiec U12= L11\A12, ale L11 - ortogonalna, wiec U12 = L11'*A12
	L21 = A12';
	L22 = (L11) - (L21*U12); 
	U23 = GEPPM(L22,A23); % L22*U23 = A23, wiec U23= L22\A23
	L32 = A23';
	L33 = (L11) - (L32*U23);

% teraz umieszczamy bloki na odpowiednich miejscach tworzac wyjsciowe macierze   
L = [     L11, zeros(p), zeros(p);
          L21,      L22, zeros(p);
     zeros(p),      L32,     L33];
U = [  eye(p),     U12, zeros(p);
     zeros(p),   eye(p),     U23;
     zeros(p), zeros(p),  eye(p)];

end

% ToDo
% beda problemy dla A11 - macierz hilberta
% zwykla metoda crouta nie jest wykonalna, ale blokowa jest
% sprawdzic, czy macierz A jest dobrze uwarunkowana
% bleda rozkladu: norm(A - L*U)/norm(A)
% moze sie zdarzyc, ze wyjsciowa A jest dobrze uwarunkowana, ale L lub U sa zle
% policzyc cond wszystkich blokow np. cond(L33), cond(L22)
% policzyc bledy wzgledne dla roznych wektorow b (Lab7)
% porownywac z A\b

function [L,U] = CroutPartition(A,p) % beda problemy dla A11 - macierz hilberta
% zwykla metoda crouta nie jest wykonalna, ale blokowa jest
% sprawdzic, czy macierz A jest dobrze uwarunkowana

[m,n] = size(A); % n is just the dimension of the  n x n input matrix A
if m ~= n 
    disp('A nie jest macierz± kwadratow±!')
    return
end
A12 = A(1:p,p+1:2*p);
A23 = A(p+1:2*p,2*p + 1: 3*p);

%%Below we calculate the blocks of L and U
	L11 = A(1:p, 1:p); % Wiemy, ze cond(l11) == 1
	U12 = L11' * A12; % L11*x = A12 x = L11\A12 where x = U12
	L21 = transpose(A12);
	L22 = (L11) - (L21*U12); % policzyc cond(L22) i wszystkich innych
	U23 = L22\A23; %L22*x = A23 x = L22\A23 where x = U23
	L32 = transpose(A23); % l32 = A23'
	L33 = (L11) - (L32*U23); % cond(L33)
   %%Now we put all the blocks together and create L and U and it is "returned" by the function
L = [     L11, zeros(p), zeros(p);
          L21,      L22, zeros(p);
     zeros(p),      L32,     L33];
U = [  eye(p),     U12, zeros(p);
     zeros(p),   eye(p),     U23;
     zeros(p), zeros(p),  eye(p)];
% bleda rozkladu:
% norma(A - L*U)/norm(A)

% moze sie zdarzyc, ze wyjsciowa A jest dobrze uwarunkowana, ale R lub U
% sa zle
end

% policzyc bledy wzgledne dla roznych wektorow b (Lab7)
% porownywac z A\b
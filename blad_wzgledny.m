N = input("Podaj N:");
for n = 1:N
    A=Wilk1(n);
    z=ones(n, 1);
    b=A*z;
    x=A\b;
    e_rel(n) = norm(x-z)/norm(z); % blad wzgledny
    wsp_stab(n) = e_rel(n)/cond(A); % wspolczynnik stabilnosci
    wsp_popr(n) = norm(b-A*x)/(norm(A)*norm(x)); % wspolczynnik poprawnosci
end
figure(1)
semilogy(wsp_stab, "r")
figure(2)
semilogy(wsp_popr, "g")
figure(3)
semilogy(e_rel, "b")

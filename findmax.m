function k = findmax(x)
%findmax finds index in x such that |x(k)| is max{|k(i)|:i = 1:n}
%   Where n = length(x)
n = length(x);

max = -inf;
k = 0;
for i= 1:n
    if(max < abs(x(i)))
        max = abs(x(i));
        k = i;
    end
end

end
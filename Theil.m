function T = Theil(v)
% normalized

n = length(v);
x = zeros(n,1);
for i=1:n
    x(i) = sum(v(i,:));
end
xm = mean(x);
T = 0;
for i=1:n
    T = T + 1/n*(x(i)/xm)*log(x(i)/xm)/log(n);
end

end


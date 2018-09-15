function H = Herfindahl(v)

n = length(v);
x = zeros(n,1);
y = zeros(n,1);
for i=1:n
    x(i) = sum(v(i,:));
    y(i) = x(i)^2;
end
H = sum(y)/(sum(x))^2;

end


function  loren2(v)
% plots lorenz curve

n = length(v);
y = zeros(n,1);
for i=1:n
    y(i) = sum(v(i,:)); 
    % y is the vector with air traffic in each airport
end
w = sort(y);
F = zeros(1,n+1);
L = zeros(1,n+1);
S(n+1) = 0;
L(n+1) = 1;
F(n+1) = 1;
for j=1:n
    S(n+1) = S(n+1) + w(j);
end
for i=2:n
   F(i) = (i-1)/n;
   S(i) = 0;
   for j=1:i-1
        S(i) = S(i) + w(j);
   end
   L(i) = S(i)/S(n+1);
end

plot(F,L);


end


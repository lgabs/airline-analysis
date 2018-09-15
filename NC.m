function NC = NC(v)
% NC: Network Concentration
% v : nxn matrix in which the element a_ij is the traffic/capacity from
%     airport i to airport j.


n = length(v);
Gmax = 1-2/n;
y = zeros(n,1);
for i=1:n
    y(i) = sum(v(i,:));
end
ym = mean(y);
k = 0;
for i=1:n
   for j=1:n
        k = k + abs(y(i)-y(j));
   end
end
G = 1/(2*n^2*ym)*k;
NC = G/Gmax;

end


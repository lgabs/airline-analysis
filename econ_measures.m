function measures_azul = econ_measures()

%2011,2010,2009
% vec_range = ['A2:F133' 'A2:F21' 'A2:F10' 'error' 'A2:F11' 'error';
%              'A2:F30' 'A2:F7' 'A2:F5' 'error' 'A2:F10' 'error';
%              'A2:F28' 'A2:F3' 'A2:F5' 'error' 'error' 'error'];  
% 
% vec_sheet = ['national' 'sudeste' 'sul' 'centro' 'nordeste' 'norte'];
% vec_ano = ['edges 11 month matlab';'edges 10 month matlab';'edges 09 month matlab'];
% 
% for ano=1:3
% 	for scope=1:6
% 		if scope~='error'
% 			net_range = vec_sheet(1,scope);
% 			range = vec_range(ano,scope);
% 			file = vec_ano(ano,1);
% 			[...]
% 	end
% end

net_range = 'national';
range = 'A2:F611';
file      = 'edges 15 month matlab';
A = xlsread(file,net_range,range);
m = size(A,1);  % number of edges
n = xlsread(file,net_range,'T1');
% n is the number of airports on the network
y = zeros(n,n); % adjacent matrix
for k=1:m
   y(A(k,2),A(k,3)) = y(A(k,2),A(k,3))+ A(k,6); 
end

NC_azul = NC(y);
H = Herfindahl(y);
V = sqrt(n*H-1);
T = Theil(y);
%lorenz(y);
rownames = {'NC';'H';'V';'T';'#nodes';'#edges'};
measures = [NC_azul;H;V;T;n;m];
table(measures,'RowNames',rownames)
disp(net_range)


end


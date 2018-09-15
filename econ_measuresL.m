function measures_azul = econ_measuresL()

%2016,2015,2014,2013,2012,2011,2010,2009
% vec_range = {'A2:F133' 'A2:F21' 'A2:F10' 'error' 'A2:F11' 'error';
%              'A2:F30' 'A2:F7' 'A2:F5' 'error' 'A2:F10' 'error';
%              'A2:F28' 'A2:F3' 'A2:F5' 'error' 'error' 'error'};  
vec_range = {'A2:F513';'A2:F611';'A2:F582';'A2:F279';'A2:F220';'A2:F133';'A2:F30';'A2:F28'};

vec_sheet = {'national' 'sudeste' 'sul' 'centro' 'nordeste' 'norte'};
vec_ano = {'edges 16 month matlab';'edges 15 month matlab';'edges 14 month matlab';'edges 13 month matlab';'edges 12 month matlab';'edges 11 month matlab';'edges 10 month matlab';'edges 09 month matlab'};
hold all
for ano=1:8
	for scope=1
		if strcmp(vec_range(ano,scope),'error')==0
			net_range = vec_sheet{1,scope};
			range = vec_range{ano,scope};
			file = vec_ano{ano,1};
            A = xlsread(file,net_range,range);
            m = size(A,1);  % number of edges
            n = xlsread(file,net_range,'T1');
            % n is the number of airports on the network
            y = zeros(n,n); % adjacent matrix
            
            for k=1:m
               y(A(k,2),A(k,3)) = y(A(k,2),A(k,3))+ A(k,6); 
            end

%             NC_azul = NC(y);
%             H = Herfindahl(y);
%             V = sqrt(n*H-1);
%             T = Theil(y);
           
            lorenz2(y);
            
%             rownames = {'NC';'H';'V';'T';'#nodes';'#edges'};
%             measures = [NC_azul;H;V;T;n;m];
%             table(measures,'RowNames',rownames)
%             disp(net_range)
%             disp(ano+2010)
        end
	end
end

% plot(U(1,1),U(1,2));
% for i=1:3
%     plot(U(i,3),U(i,4));
% end
x = linspace(0,1,100);
f = x;
plot(x,f,'--');
legend('2016','2015','20014','2013','2012','2011','2010','2009','equality');
xlabel('Cumulative share of airports');
ylabel('Cumulative share of traffic');





end


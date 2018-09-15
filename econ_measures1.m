function measures_azul = econ_measures1()

%2016,2015,2014,2013,2011,2010,2009
vec_range = {'A2:F519' 'A2:F513' 'A2:F102' 'A2:F36' 'A2:F22' 'A2:F62' 'A2:F37'   % 2016
             'A2:F615' 'A2:F611' 'A2:F109' 'A2:F41' 'A2:F23' 'A2:F66' 'A2:F64';  % 2015
             'error'   'A2:F582' 'A2:F140' 'A2:F41' 'A2:F29' 'A2:F60' 'A2:F63';  % 2014
             'error'   'A2:F279' 'A2:F66'  'A2:F11' 'A2:F7'  'A2:F24' 'A2:F13';  % 2013
             'error'   'A2:F220' 'A2:F61'   'A2:F13' 'A2:F5'  'A2:F19' 'A2:F3';  % 2012
             'error'   'A2:F133' 'A2:F21'  'A2:F10' 'error'  'A2:F11' 'error';   % 2011
             'error'   'A2:F53'  'A2:F7'   'A2:F5'  'error'  'A2:F10' 'error';   % 2010
             'error'   'A2:F28'  'A2:F3'   'A2:F5'  'error'  'error'  'error'};  % 2009

vec_sheet = {'whole' 'national' 'sudeste' 'sul' 'centro' 'nordeste' 'norte'};
vec_ano = {'edges 16 month matlab';'edges 15 month matlab';
           'edges 14 month matlab';'edges 13 month matlab';'edges 12 month matlab';
           'edges 11 month matlab';'edges 10 month matlab';'edges 09 month matlab'};

for ano=1
	for scope=2
		if strcmp(vec_range(ano,scope),'error')==0
			net_range = vec_sheet{1,scope};
			range = vec_range{ano,scope};
			file = vec_ano{ano,1};
            A = xlsread(file,net_range,range);
            m = size(A,1);  % number of edges
            n = xlsread(file,net_range,'T1');
            % n is the number of airports on the network
            y = zeros(n,n); % adjacent matrix
            
            % column A(i,6): seat capacity
            % column A(i,5): frequency
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
            disp(2016-ano+1)
        end
	end
end





end


% MAIN SCRIPT


%% company data
E = 284226;
D = 143780;
V = E+D;

E_V_ratio = E/V;
D_V_ratio = D/V;

beta = 0.871619;
r_f = 0.0187;            % risk free rate 5Y ACGV
Er_m = 0.1049;            % expected market return
r_d = 0.04;             % return on debt
T = 0.3;                % tax = 30%
err = 0;                % error term

add_capex = 0;

%% Listing
WACC = wacc(E_V_ratio,beta,Er_m,r_f,r_d,T,err);

NPV = [];

for a = 1:length(WACC);
    NPV(a,1) = DCF(2015,2019,0,0,0,0,WACC(a),add_capex,2015);
end

NPV

megamatrix = zeros();
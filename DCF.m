function NPV=DCF(startyear,endyear,coal_price,coal_quantity,royalty_rate,tax_rate,discount_rate,add_capex,acyear)
%Please start by entering the startyear and endyear
%DCF is PV at startyear
%Range is from 2010 to 2019 (subject to change)
%If variables are using excel data from question set ,type 0 to that data field
%Entering Startyear,Endyear and Discount_rate is a must

%Assumptions:
% 1. "COGS ex royalty" is not related to quanity
% 2. Interest payment is fixed
% 3. Depreciation is fixed
% 4. Cap_ex is fixed



if coal_price==0
    coal_price=[106.035	130.1241667	103.2483333	90.60416667	75.12083333	75	75	75	75	75];
end
if coal_quantity==0;
    coal_quantity=[2621	4170	4590	4820	5000	5500	6000	7000	7000	7000];
end
if royalty_rate==0
    royalty_rate=0.35;
end
if tax_rate==0
    tax_rate=0.3;
end

if add_capex==0
    add_capex=0;
end


year=(2010:2019);



cogs_ex_royalty=[56728.79275	98083.77875	220131.5525	182150.7708	185000	193500	202000	219000	219000	219000];
SGA=[49000	109000	77000	79000	65000	60000	62000	64000	66000	68000];

interest_expense=[5000	5000	5000	5000	5000	5000	5000	5000	5000	5000];
depreciation=[20000	25000	25000	29000	34000	36000	38000	40000	42000	44000];
cap_ex=[50000	0	40000	40000	20000	20000	20000	20000	20000	20000];
addi=find(year==acyear);
cap_ex(addi) = cap_ex(addi)+add_capex;


sales=coal_price.*coal_quantity;
cogs=coal_price.*royalty_rate.*coal_quantity+cogs_ex_royalty;
gross_profit=sales-cogs;
EBIT=gross_profit-SGA;
tax=(EBIT-interest_expense)*tax_rate;
work_cap=(sales+cogs)*.1;
change_work_cap=[500 diff(work_cap)];
CF=EBIT+depreciation-cap_ex-tax-change_work_cap;


%Discount factor calculation
startidx=find(year==startyear);
endidx=find(year==endyear);
for i=1:length(year)
    discount_factor(i)=(1+discount_rate).^(-(i-startidx));
end

DCF_intermedi=CF.*discount_factor;
DCF=DCF_intermedi(startidx:endidx);
NPV=sum(DCF,2);

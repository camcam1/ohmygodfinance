function wacc=wacc(E_over_V,beta,Er_m,r_f,r_d,tax_rate,err)
if r_f == 0;
    r_f=0.0187; %From Australian Governemnt Bond Rate 
end

if err == 0;
    err =0;
end

r_e=r_f+beta.*(Er_m-r_f)+err;

wacc=E_over_V*r_e+(1-E_over_V)*r_d*(1-tax_rate);

end



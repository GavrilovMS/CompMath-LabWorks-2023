function res = PolynomIntegral_Lagerr(pol)
    len = length(pol);
    res = 0;
    for i = 1:len
        res = res + polyval(pol, 0);
        pol = PolynomDif(pol);
    end
end
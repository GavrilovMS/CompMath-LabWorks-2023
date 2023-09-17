function res = ScalarMult_Lagger(pol1, pol2)
    pol = conv(pol1, pol2);
    res = PolynomIntegral_Lagerr(pol);
end


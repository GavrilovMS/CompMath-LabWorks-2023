function res = ScalarMult_Sqrt(a, b, pol1, pol2)
    pol = conv(pol1, pol2);
    res = PolynomIntegral_Sqrt(a, b, pol);
end

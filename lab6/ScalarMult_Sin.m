function res = ScalarMult_Sin(a, b, pol1, pol2)
    pol = conv(pol1, pol2);
    res = PolynomIntegral_Sin(a, b, pol);
end
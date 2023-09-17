function res = ScalarMult(a, b, pol1, pol2)
    pol = conv(pol1, pol2);
    pol = PolynomIntegral(pol);
    res = polyval(pol,b) - polyval(pol, a);
end
function res = PolynomIntegral_Sqrt(a, b, pol)
    len = length(pol);
    pows = zeros(1, len);
    res_a = 0;
    res_b = 0;
    for i = 1:len
        pows(i) = len-i+1/2+1;
        pol(i) = pol(i)/pows(i);
        res_a = res_a + pol(i)*a^pows(i);
        res_b = res_b + pol(i)*b^pows(i);
    end
    res = res_b - res_a;
end
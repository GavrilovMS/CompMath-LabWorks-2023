function res = PolynomIntegral_Sin(a, b, pol)
    len = length(pol);
    res = 0;
    for i = 1:len
        check = mod(i, 4);
        if check == 0
            f = @(x) -sin(x);
        end
        if check == 1
            f = @(x) -cos(x);
        end
        if check == 2
            f = @(x) sin(x);
        end
        if check == 3
            f = @(x) cos(x);
        end
        res = res + (f(b)*polyval(pol, b) - f(a)*polyval(pol, a));
        pol = PolynomDif(pol);
    end
end
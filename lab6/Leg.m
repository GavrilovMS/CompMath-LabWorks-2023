function res = Leg(n)
    res = 1;
    for i = 1:n
        res = conv(res, [1, 0, -1]);
    end
    for i = 1:n
       res = PolynomDif(res);
    end
end


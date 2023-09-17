function res = Lagerr(n)
    pols = zeros(n+1, n+1);
    for i = 1:n+1
        pols(i, n+2-i) = 1;
    end
    for i = 2:n+1
        sum = zeros(1, n+1);
        for k = 1:i-1
            alfa = ScalarMult_Lagger(pols(i,:), pols(k, :))/ScalarMult_Lagger(pols(k,:), pols(k, :));
            sum = sum + pols(k, :)*alfa;
        end
        pols(i, :) = pols(i, :) - sum;
    end
    res = pols;
end
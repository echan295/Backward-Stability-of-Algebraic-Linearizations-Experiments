function b = baryweights(tau)
    n = length(tau);
    b = ones(1, n);
    for k = 1:n
        for j = 1:n
            if j ~=k
                b(k) = b(k)/(tau(k) - tau(j));
            end
        end
    end
end
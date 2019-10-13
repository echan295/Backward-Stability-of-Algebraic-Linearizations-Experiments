function y = lagrange(tau, rho, x)
    y = zeros(size(x));
    for k = 1:length(tau)
        L = ones(size(x));
        for i = 1:length(tau)
            if i ~= k
                L = L .* (x - tau(i))/(tau(k) - tau(i));
            end
        end
        y = y + rho{k}*L;
    end
end
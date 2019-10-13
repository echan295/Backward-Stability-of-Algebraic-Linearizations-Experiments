function A = makeRandomMatrixWhole(n, N, nmax)
    A = cell(1, N+1);
    for i = 1:N+1
        A{i} = randi(nmax, n);
    end
end
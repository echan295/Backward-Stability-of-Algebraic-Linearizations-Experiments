function A = makeRandomBohemianMatrix(imin, imax, n, N)
    A = cell(1, N+1);
    for i = 1:N+1
        A{i} = randi([imin, imax], n);
    end
end
function A = makeRandomMatrix(n, N)
    A = cell(1, N+1);
    for i = 1:N+1
        A{i} = rand(n);
    end
end
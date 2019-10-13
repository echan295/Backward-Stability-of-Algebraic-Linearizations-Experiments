function E = evalMPolyBernstein(A, z)
    N = length(A);
    E = zeros(size(A{1}));
    for i = 1:N
        E = E + A{i}*bernsteinbasis(i-1, N-1, 0, 1, z);
    end
end
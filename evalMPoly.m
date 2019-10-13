function E = evalMPoly(A, z)
    N = length(A);
    E = A{1};
    for i = 2:N
        E = E + A{i}*z^(i-1);
    end
end
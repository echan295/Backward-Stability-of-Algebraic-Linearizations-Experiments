function Ap = perturb_matrixPoly(A, epsilon)
    N = length(A);
    n = size(A{1});
    Ap = cell(1, N);
    for i = 1:N
        r = rand(n);
        Ap{i} = A{i} + epsilon*(r/norm(r));
    end
end
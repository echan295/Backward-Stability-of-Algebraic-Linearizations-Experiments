load example1.mat
R = 1000;
e = 0.05;

% figure();
hold on;
for i = 1:R
    Ap = perturb_matrixPoly(A, e);
    Bp = perturb_matrixPoly(B, e);
    R = rand(3);
    cp = c + (R/norm(R))*e;
    [C0, C1, X, Y] = algebraicLinearization(Ap, Bp, c, d);
    plot(eig(C0, C1), 'k.')
end
hold off;
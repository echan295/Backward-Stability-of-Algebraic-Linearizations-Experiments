load example1.mat
R = 1000;
e = 0.05;

c = eye(3);
d = eye(3);

% figure();
hold on;
for i = 1:R
    M = ALMultCoeff(A, B, c, d);
    Mp = perturb_matrixPoly(M, e);
    [C0, C1, X, Y] = companionMatrix(Mp);
    plot(eig(C0, C1), 'k.')
end
hold off;
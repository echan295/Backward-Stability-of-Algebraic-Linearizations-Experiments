load example10.mat

AB = ALMultCoeff(A, B, cab, d);
CD = ALMultCoeff(C, D, ccd, d);

ABCD = ALMultCoeff(AB, CD, cabcd, d);

[C0, C1, X, Y] = companionMatrix(ABCD);

% plot(eig(C0, C1), 'k.')

x = linspace(-1.5, 1.5, 1000);
y = linspace(-1.5, 1.5, 1000);
[x, y] = meshgrid(x, y);

z = zeros(1000);

for i = 1:1000
    for j = 1:1000
        Z = x(i, j) + 1i*y(i, j);
        z(i, j) = min(svd(Z*C1 - C0));
    end
end

contour(x, y, z, logspace(-3, 2, 20));
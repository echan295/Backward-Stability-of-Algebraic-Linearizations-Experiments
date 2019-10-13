load example2.mat

M = ALMultCoeff(A, B, c, d);
[C0, C1, X, Y] = companionMatrix(M);

% E = eig(C0, C1);
% plot(E, 'k.');

x = linspace(-2.5, 2.5, 1000);
y = linspace(-2.5, 2.5, 1000);

[x, y] = meshgrid(x, y);

z = zeros(1000);

for i = 1:1000
    for j = 1:1000
        Z = x(i, j) + 1i*y(i, j);
        z(i, j) = min(svd(Z*C1 - C0));
    end
end

contour(x, y, z);
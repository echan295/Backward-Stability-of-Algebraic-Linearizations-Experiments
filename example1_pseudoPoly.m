load example1.mat

x = linspace(-4, 3, 1000);
y = linspace(-2, 2, 1000);
[x, y] = meshgrid(x, y);
z = zeros(1000);

for i = 1:1000
    for j = 1:1000
        zz = x(i, j) + 1i*y(i, j);
        z(i, j) = min(svd(zz*evalMPoly(A, zz)*evalMPoly(B, zz) + eye(3)))/4.542442943577182;
    end
end

% contour(x, y, z, linspace(0.05, 0.4, 10));
contour(x, y, z, logspace(-4, 0, 15))
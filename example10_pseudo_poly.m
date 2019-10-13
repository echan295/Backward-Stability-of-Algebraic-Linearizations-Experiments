load example10.mat

x = linspace(-1.5, 1.5, 1000);
y = linspace(-1.5, 1.5, 1000);
[x, y] = meshgrid(x, y);

z = zeros(1000);

for i = 1:1000
    for j = 1:1000
        Z = x(i, j) + 1i*y(i, j);
        z(i, j) = min(svd(Z*(Z*evalMPoly(A, Z)*d*evalMPoly(B, Z) + cab)*d*(Z*evalMPoly(C, Z)*d*evalMPoly(D, Z) + ccd) + cabcd));
    end
end

contour(x, y, z, linspace(0.01, 1, 15))
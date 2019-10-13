load example5.mat

M{1} = c;
M{2} = (1/5)*A{1}*B{1} + c;
M{3} = (1/5)*(A{1}*B{2} + A{2}*B{1}) + c;
M{4} = (1/10)*(A{1}*B{3} + 4*A{2}*B{2} + A{3}*B{1}) + c;
M{5} = (2/5)*(A{2}*B{3} + A{3}*B{2}) + c;
M{6} = A{3}*B{3} + c;

[C0, C1, X, Y] = companionMatrix(M, 'basis', 'Bernstein');

plot(eig(C0, C1), 'k.')

x = linspace(-3, 6, 1000);
y = linspace(-3, 3, 1000);
[x, y] = meshgrid(x, y);

z = zeros(1000);

for i = 1:1000
    for j = 1:1000
        Z = x(i, j) + 1i*y(i, j);
        z(i, j) = min(svd(Z*C1 - C0));
    end
end

contour(x, y, z, linspace(0.01, 3, 25), 'showText', 'On')
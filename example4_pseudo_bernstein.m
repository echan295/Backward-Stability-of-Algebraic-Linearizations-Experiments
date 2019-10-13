load example4.mat

M{1} = c;
M{2} = (1/5)*A{1}*B{1} + c;
M{3} = (1/5)*(A{1}*B{2} + A{2}*B{1}) + c;
M{4} = (1/10)*(A{1}*B{3} + 4*A{2}*B{2} + A{3}*B{1}) + c;
M{5} = (2/5)*(A{2}*B{3} + A{3}*B{2}) + c;
M{6} = A{3}*B{3} + c;

[C0, C1, X, Y] = companionMatrix(M, 'basis', 'Bernstein');

plot(eig(C0, C1), 'k.')
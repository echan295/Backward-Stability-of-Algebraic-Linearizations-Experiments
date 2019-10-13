load example1.mat

R = 1000;
e = 0.05;

figure();
hold on;
for i = 1:R
    Ap = perturb_matrixPoly(A, e);
    Bp = perturb_matrixPoly(B, e);
    
    plot(eig(zz*evalMPoly(Ap, zz)*d*evalMPoly(Bp, zz) + c), 'k.')
end
hold off;
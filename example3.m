colormap(jet);

subplot(1, 2, 1)
example3_pseudo
axis('square');

subplot(1, 2, 2)
example3_pseudo_frobenius
axis('square');

shading interp;
caxis manual
caxis([1e-4, 0.4]);

xoffset = -0.04;
hp4 = get(subplot(1,2,2),'Position');
colorbar('Position', [hp4(1)+hp4(3)+0  hp4(2)  0.03  hp4(2)+hp4(3)*2.1])
hp4(1) = hp4(1) + xoffset;
set(subplot(1, 2, 2), 'Position', hp4)

hp4 = get(subplot(1,2,1),'Position');
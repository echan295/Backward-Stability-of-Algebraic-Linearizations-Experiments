colormap(jet)

subplot(2, 2, 1)
example9_pseudo_poly

subplot(2, 2, 2)
example9_pseudo

subplot(2, 2, 3)
example9_pseudo_monomial

subplot(2, 2, 4)
example9_pseudo_frobenius

%%
shading interp;
caxis manual
caxis([1e-3, 1000]);
%%
xoffset = -0.04;
hp4 = get(subplot(2,2,4),'Position');
colorbar('Position', [hp4(1)+hp4(3)+0  hp4(2)  0.03  hp4(2)+hp4(3)*2.1])
hp4(1) = hp4(1) + xoffset;
set(subplot(2, 2, 4), 'Position', hp4)

hp4 = get(subplot(2,2,3),'Position');
hp4(1) = hp4(1) + xoffset;
set(subplot(2, 2, 3), 'Position', hp4)

hp4 = get(subplot(2,2,2),'Position');
hp4(1) = hp4(1) + xoffset;
set(subplot(2, 2, 2), 'Position', hp4)

hp4 = get(subplot(2,2,1),'Position');
hp4(1) = hp4(1) + xoffset;
set(subplot(2, 2, 1), 'Position', hp4)

colormap(jet)

% subplot(1, 3, 1)
% example10_pseudo_poly

subplot(1, 3, 1)
example10_pseudo
axis('square');

%%
subplot(1, 3, 2)
example10_pseudo_ALfrobenius
axis('square')

%%
subplot(1, 3, 3)
example10_pseudo_frobenius
axis('square')

%%
shading interp;
caxis manual
caxis([1e-3, 1e2]);

%%
xoffset = -0.04;
hp4 = get(subplot(1,3,3),'Position');
colorbar('Position', [hp4(1)+hp4(3)+0  2*hp4(2)  0.03  hp4(2)+hp4(3)*2.1])
hp4(1) = hp4(1) + xoffset;
set(subplot(1, 3, 3), 'Position', hp4)

hp4 = get(subplot(1, 3, 2),'Position');
hp4(1) = hp4(1) + xoffset/2;
set(subplot(1, 3, 2), 'Position', hp4)
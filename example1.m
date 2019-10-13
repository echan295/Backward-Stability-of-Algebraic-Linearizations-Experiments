subplot(1, 2, 1);
example1_pseudo
hold on
example1_perturb
hold off
axis('square');
% ylabel('Im');

%%
subplot(1, 2, 2);
example1_pseudo_monomial
hold on
example1_perturb_monomial
axis([-4, 3, -2, 2])
hold off
axis('square');

%%
shading interp;
caxis manual
caxis([0.05, 0.4]);

xoffset = -0.04;
hp4 = get(subplot(1,2,2),'Position');
colorbar('Position', [hp4(1)+hp4(3)+0  hp4(2)  0.03  hp4(2)+hp4(3)*2.1])
hp4(1) = hp4(1) + xoffset;
set(subplot(1, 2, 2), 'Position', hp4)

hp4 = get(subplot(1,2,1),'Position');
% hp4(1) = hp4(1) + xoffset;
% set(subplot(1, 2, 1), 'Position', hp4)




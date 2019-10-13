subplot(1, 2, 1);
bohemian1AL
axis('square');

%%
subplot(1, 2, 2);
bohemian1_FL
axis('square');

%%
shading interp;
caxis manual
caxis([0.01, 0.18]);

xoffset = -0.04;
hp4 = get(subplot(1,2,2),'Position');
colorbar('Position', [hp4(1)+hp4(3)+0  hp4(2)  0.03  hp4(2)+hp4(3)*2.1])
hp4(1) = hp4(1) + xoffset;
set(subplot(1, 2, 2), 'Position', hp4)

hp4 = get(subplot(1,2,1),'Position');




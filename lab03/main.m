params;

Wp = tf(B, A);

my_bode(Wp);
%w = logspace(-6, 1, 1000);

figure('Name', 'nyquist(sys)');
axis([-4, 4, -4, 4]);
nyquist(Wp, {1,1000});
grid on
draw_circle(1);
saveas(gcf, 'graphics/Nyquist.png');

figure('Name', 'margin(sys)');
margin(Wp);
saveas(gcf, 'graphics/Bode.png');

figure('Name', 'My epic_nyquist(sys)');
my_nyquist(Wp, {1,1000});
draw_circle(1);
axis ([-1.5,1.5,-1.5,1.5],"square")


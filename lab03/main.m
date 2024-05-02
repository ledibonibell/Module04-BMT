T1 = 0.7;
k1 = 1.6;
T = 0.1;
k = 1;
B = k * k1;
A = [T * T1, T + T1, 1, 0];

Wp = tf(B, A);

my_bode(Wp);
%w = logspace(-6, 1, 1000);

figure('Name', 'nyquist(sys)');
axis([-4, 4, -4, 4]);
nyquist(Wp, {1,1000});
grid on
draw_circle(1);

figure('Name', 'margin(sys)');
margin(Wp);


figure('Name', 'My epic_nyquist(sys)');
my_nyquist(Wp, {1,1000});
draw_circle(1);
axis ([-1.5,1.5,-1.5,1.5],"square")

calculate_stability_margins_nyquist

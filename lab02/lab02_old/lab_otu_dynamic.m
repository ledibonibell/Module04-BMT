%% Вызов переменных

options;


%% Усилительное звено


w1 = tf(K, 1);
lable_name = 'W_1(S)';

figure('position', [400, 200, 900, 750])
t = tiledlayout(3, 4);
title(t, "Усилительное звено");

% Реакция на единичное воздействие: step
subplot(3, 2, 1);

[y1, tOut] = step(w1, 4);
plot(tOut, y1, 'b-', 'LineWidth', 1);
grid on

legend(lable_name)
title('Реакция на единичное воздействие: step')
xlabel('Время, c');
ylabel('x(t)');


% Реакция на единичное воздействие: impulse
subplot(3, 2, 2);

[y1, tOut] = impulse(w1, 4);
plot(tOut, y1, 'b-', 'LineWidth', 1);
grid on

legend(lable_name);
title('Реакция на импульсное воздействие: impulse');
xlabel('Время, c');
ylabel('x(t)');


% ЛАЧХ
subplot(3, 2, 3);

[mag, ph, wout] = bode(w1);
mag = squeeze(mag);
semilogx(wout, mag2db(abs(mag)), 'b-', 'LineWidth', 1);
grid on

legend(lable_name);
title('ЛАЧХ');
ylabel('Амплитуда, дБ');
xlabel('Частота, Гц');


% ЛФЧХ
subplot(3, 2, 5);

[mag, phase, wout] = bode(w1);
phase = squeeze(phase);
semilogx(wout, phase, 'b-', 'LineWidth', 1);
grid on

legend(lable_name);
title('ЛФЧХ')
ylabel('Фаза, градусы');
xlabel('Частота, Гц');


% Годограф Найквиста
subplot(3, 2, [4, 6]);

k = 1000;
w = linspace(-k, k,10*k);
[re,im, wout] = nyquist(w1, w);
re = squeeze(re);
im = squeeze(im);
plot(re, im, 'b-', -1, 0, 'b*', 'LineWidth', 1)
grid on

legend(lable_name);
title('Годограф Найквиста')
xlabel('Действительная ось');
ylabel('Мнимая ось');

sgtitle('Усилительное звено')
saveas(gcf, 'graphics/Усилительное звено.png');


%% Интегрирующее звено


w2 = tf(K, [1, 0]);
lable_name = 'W_2(S)';

figure('position', [400, 200, 900, 750])
t = tiledlayout(3, 4);
title(t, "Интегрирующее звено");


% Реакция на единичное воздействие: step
subplot(3, 2, 1);

[y2, tOut] = step(w2, 4);
plot(tOut, y2, 'b-', 'LineWidth', 1);
grid on

legend(lable_name)
title('Реакция на единичное воздействие: step')
xlabel('Время, c');
ylabel('x(t)');


% Реакция на единичное воздействие: impulse
subplot(3, 2, 2);

[y2, tOut] = impulse(w2, 4);
plot(tOut, y2, 'b-', 'LineWidth', 1);
grid on

legend(lable_name);
title('Реакция на импульсное воздействие: impulse');
xlabel('Время, c');
ylabel('x(t)');


% ЛАЧХ
subplot(3, 2, 3);

[mag, ph, wout] = bode(w2);
mag = squeeze(mag);
semilogx(wout, mag2db(abs(mag)), 'b-', 'LineWidth', 1);
grid on

legend(lable_name);
title('ЛАЧХ');
ylabel('Амплитуда, дБ');
xlabel('Частота, Гц');

% ЛФЧХ
subplot(3, 2, 5);

[mag, phase, wout] = bode(w2);
phase = squeeze(phase);
semilogx(wout, phase, 'b-', 'LineWidth', 1);
grid on

legend(lable_name);
title('ЛФЧХ')
ylabel('Фаза, градусы');
xlabel('Частота, Гц');

% Годограф Найквиста
subplot(3, 2, [4, 6]);

k = 1000;
w = linspace(-k, k,10*k);
[re,im, wout] = nyquist(w2, w);
re = squeeze(re);
im = squeeze(im);
plot(re, im, 'b-', -1, 0, 'b*', 'LineWidth', 1)
grid on

legend(lable_name);
title('Годограф Найквиста')
xlabel('Действительная ось');
ylabel('Мнимая ось');

sgtitle('Интегрирующее звено')
saveas(gcf, 'graphics/Интегрирующее звено.png');


%% Апериодическое звено


w3 = tf(K, [T, 1]);
lable_name = 'W_3(S)';

figure('position', [400, 200, 900, 750])
t = tiledlayout(3, 4);
title(t, "Апериодическое звено");

% Реакция на единичное воздействие: step
subplot(3, 2, 1);

[y3, tOut] = step(w3, 4);
plot(tOut, y3, 'b-', 'LineWidth', 1);
grid on

legend(lable_name)
title('Реакция на единичное воздействие: step')
xlabel('Время, c');
ylabel('x(t)');

% Реакция на единичное воздействие: impulse
subplot(3, 2, 2);

[y3, tOut] = impulse(w3, 4);
plot(tOut, y3, 'b-', 'LineWidth', 1);
grid on

legend(lable_name);
title('Реакция на импульсное воздействие: impulse');
xlabel('Время, c');
ylabel('x(t)');

% ЛАЧХ
subplot(3, 2, 3);

[mag, ph, wout] = bode(w3);
mag = squeeze(mag);
semilogx(wout, mag2db(abs(mag)), 'b-', 'LineWidth', 1);
grid on

legend(lable_name);
title('ЛАЧХ');
ylabel('Амплитуда, дБ');
xlabel('Частота, Гц');

% ЛФЧХ
subplot(3, 2, 5);

[mag, phase, wout] = bode(w3);
phase = squeeze(phase);
semilogx(wout, phase, 'b-', 'LineWidth', 1);
grid on

legend(lable_name);
title('ЛФЧХ')
ylabel('Фаза, градусы');
xlabel('Частота, Гц');

% Годограф Найквиста
subplot(3, 2, [4, 6]);

k = 1000;
w = linspace(-k, k,10*k);
[re,im, wout] = nyquist(w3, w);
re = squeeze(re);
im = squeeze(im);
plot(re, im, 'b-', -1, 0, 'b*', 'LineWidth', 1)
grid on

legend(lable_name);
title('Годограф Найквиста')
xlabel('Действительная ось');
ylabel('Мнимая ось');

sgtitle('Апериодическое звено')
saveas(gcf, 'graphics/Апериодическое звено.png');


%% Реальное дифференцирующее звено 1–го порядка


s = tf('s');
sys = T*s + 1;
w4 = sys*tf(1, [0.000000001 1]);
lable_name = 'W_4(S)';

figure('position', [400, 200, 900, 750])
t = tiledlayout(3, 4);
title(t, "Реальное дифференцирующее звено 1–го порядка");

% Реакция на единичное воздействие: step
subplot(3, 2, 1);

[y4, tOut] = step(w4, 4);
plot(tOut, y4, 'b-', 'LineWidth', 1);
legend(lable_name)
grid on

title('Реакция на единичное воздействие: step')
xlabel('Время, c');
ylabel('x(t)');

% Реакция на единичное воздействие: impulse
subplot(3, 2, 2);

[y4, tOut] = impulse(w4, 4);
plot(tOut, y4, 'b-', 'LineWidth', 1);
grid on

legend(lable_name);
title('Реакция на импульсное воздействие: impulse');
xlabel('Время, c');
ylabel('x(t)');

% ЛАЧХ
subplot(3, 2, 3);

[mag, ph, wout] = bode(w4);
mag = squeeze(mag);
semilogx(wout, mag2db(abs(mag)), 'b-', 'LineWidth', 1);
grid on

legend(lable_name);
title('ЛАЧХ');
ylabel('Амплитуда, дБ');
xlabel('Частота, Гц');

% ЛФЧХ
subplot(3, 2, 5);

[mag, phase, wout] = bode(w4);
phase = squeeze(phase);
semilogx(wout, phase, 'b-', 'LineWidth', 1);
grid on

legend(lable_name);
title('ЛФЧХ')
ylabel('Фаза, градусы');
xlabel('Частота, Гц');

% Годограф Найквиста
subplot(3, 2, [4, 6]);

k = 1000;
w = linspace(-k, k,10*k);
[re,im, wout] = nyquist(w4, w);
re = squeeze(re);
im = squeeze(im);
plot(re, im, 'b-', -1, 0, 'b*', 'LineWidth', 1)
grid on

legend(lable_name);
title('Годограф Найквиста')
xlabel('Действительная ось');
ylabel('Мнимая ось');

sgtitle('Реальное дифференцирующее звено 1–го порядка')
saveas(gcf, 'graphics/Реальное дифференцирующее звено 1–го порядка.png');


%% Колебательное звено с коэффициентом усиления


w5 = tf(K, [T^2, 2*T*ksi, 1]);
w6 = tf(2*K, [T^2, 2*T*ksi, 1]);
first_legend = 'W_5(S)';
second_legend = 'W_6(S)';

figure('position', [400, 200, 900, 750])
t = tiledlayout(3, 4);
title(t, "Колебательные звенья с разным коэффициентом усиления");

% Реакция на единичное воздействие: step
subplot(3, 2, 1);

[y5, tOut] = step(w5, 4);
y6 = step(w6, 4);
plot(tOut, y5, 'b', tOut, y6, 'g', 'LineWidth', 1);
grid on

legend(first_legend, second_legend);
title('Реакция на единичное воздействие: step')
xlabel('Время, c');
ylabel('x(t)');

% Реакция на единичное воздействие: impulse
subplot(3, 2, 2);

[y5, tOut] = impulse(w5, 4);
y6 = impulse(w6, 4);
plot(tOut, y5, 'b', tOut, y6, 'g', 'LineWidth', 1);
grid on

legend(first_legend, second_legend);
title('Реакция на импульсное воздействие: impulse');
xlabel('Время, c');
ylabel('x(t)');

% ЛАЧХ
subplot(3, 2, 3);

[mag5, phase5, wout] = bode(w5);
mag5 = squeeze(mag5);
[mag6, phase6, wout] = bode(w6);
mag6 = squeeze(mag6);
semilogx(wout,mag2db(abs(mag5)),'b', wout,mag2db(abs(mag6)),'g', 'LineWidth', 1);
grid on

legend(first_legend, second_legend);
title('ЛАЧХ');
ylabel('Амплитуда, дБ');
xlabel('Частота, Гц');

% ЛФЧХ
subplot(3, 2, 5);

[mag5, phase5, wout] = bode(w5);
phase5 = squeeze(phase5);
[mag6, phase6, wout] = bode(w6);
phase6 = squeeze(phase6);
semilogx(wout, phase5, 'b', wout, phase6, 'g', 'LineWidth', 1);
grid on

legend(first_legend, second_legend);
title('ЛФЧХ')
ylabel('Фаза, градусы');
xlabel('Частота, Гц');

% Годограф Найквиста
subplot(3, 2, [4, 6]);

k = 1000;
w = linspace(-k, k,100*k);
[re5,im5, wout] = nyquist(w5, w);
re5 = squeeze(re5);
im5 = squeeze(im5);
[re6,im6, wout] = nyquist(w6, w);
re6 = squeeze(re6);
im6 = squeeze(im6);
plot(re5,im5,'b', re6,im6,'g', -1, 0, 'b*', 'LineWidth', 1)
grid on

legend(first_legend, second_legend);
title('Годограф Найквиста')
xlabel('Действительная ось');
ylabel('Мнимая ось');

sgtitle('Колебательное звено с коэффициентом усиления')
saveas(gcf, 'graphics/Колебательное звено с коэффициентом усиления.png');


%% Колебательные звенья с разной постоянной времени


w5 = tf(1, [T^2, 2*T*ksi, 1]);
T = T*2;
w7 = tf(1, [T^2, 2*T*ksi, 1]);
first_legend = 'W_5(S)';
second_legend = 'W_7(S)';

figure('position', [400, 200, 900, 750])
t = tiledlayout(3, 4);
title(t, "Колебательные звенья с разной постоянной времени");

% Реакция на единичное воздействие: step
subplot(3, 2, 1);

[y5, tOut] = step(w5, 4);
y7 = step(w7, 4);
plot(tOut, y5, 'b', tOut, y7, 'g', 'LineWidth', 1);
grid on

legend(first_legend, second_legend);
title('Реакция на единичное воздействи: step')
xlabel('Время, c');
ylabel('x(t)');

% Реакция на единичное воздействие: impulse
subplot(3, 2, 2);

[y5, tOut] = impulse(w5, 4);
y7 = impulse(w7, 4);
plot(tOut, y5, 'b', tOut, y7, 'g', 'LineWidth', 1);
grid on

legend(first_legend, second_legend);
title('Реакция на импульсное воздействие: impulse');
xlabel('Время, c');
ylabel('x(t)');

% ЛАЧХ
subplot(3, 2, 3);

k = 100;
t = linspace(-k, k,10*k);
[mag5, phase5, wout] = bode(w5, t);
mag5 = squeeze(mag5);
[mag7, phase7, wout] = bode(w7, t);
mag7 = squeeze(mag7);
semilogx(wout, mag2db(abs(mag5)), 'b', wout, mag2db(abs(mag7)), 'g', 'LineWidth', 1);
grid on

legend(first_legend, second_legend);
title('ЛАЧХ');
ylabel('Амплитуда, дБ');
xlabel('Частота, Гц');

% ЛФЧХ
subplot(3, 2, 5);

[mag5, phase5, wout] = bode(w5, t);
phase5 = squeeze(phase5);
[mag7, phase7, wout] = bode(w7, t);
phase7 = squeeze(phase7);
semilogx(wout, phase5, 'b', wout, phase7, 'g', 'LineWidth', 1);
grid on

legend(first_legend, second_legend);
title('ЛФЧХ')
ylabel('Фаза, градусы');
xlabel('Частота, Гц');

% Годограф Найквиста
subplot(3, 2, [4, 6]);

t = linspace(-k, k, 100*k);
[re5,im5, wout] = nyquist(w5, t);
re5 = squeeze(re5);
im5 = squeeze(im5);
[re7,im7, wout] = nyquist(w7, t);
re7 = squeeze(re7);
im7 = squeeze(im7);
plot(re5,im5,'b', re7,im7,'g', -1, 0, 'b*', 'LineWidth', 1)
grid on

legend(first_legend, second_legend);
title('Годограф Найквиста')
xlabel('Действительная ось');
ylabel('Мнимая ось');

sgtitle('Колебательные звенья с разной постоянной времени')
saveas(gcf, 'graphics/Колебательные звенья с разной постоянной времени.png');


%% Колебательные звенья с разной постоянной демпфирования


w5 = tf(1, [T^2, 2*T*ksi, 1]);
ksi = ksi / 2;
w8 = tf(1, [T^2, 2*T*ksi, 1]);
first_legend = 'w5';
second_legend = 'w8';

figure('position', [400, 200, 900, 750])
t = tiledlayout(3, 4);
title(t, "Колебательные звенья с разным коэффициентом демпфирования");

% Реакция на единичное воздействие: step
subplot(3, 2, 1);

[y5, tOut] = step(w5, 4);
y8 = step(w8, 4);
plot(tOut, y5, 'b', tOut, y8, 'g', 'LineWidth', 1);
grid on

legend(first_legend, second_legend);
title('Реакция на единичное воздействие: step')
xlabel('Время, c');
ylabel('x(t)');

% Реакция на единичное воздействие: impulse
subplot(3, 2, 2);

[y5, tOut] = impulse(w5, 4);
y8 = impulse(w8, 4);
plot(tOut, y5, 'b', tOut, y8, 'g', 'LineWidth', 1);
grid on

legend(first_legend, second_legend);
title('Реакция на импульсное воздействие: impulse');
xlabel('Время, c');
ylabel('x(t)');

% ЛАЧХ
subplot(3, 2, 3);

k = 100;
t = linspace(-k, k, 10*k);
[mag5, phase5, wout] = bode(w5, t);
mag5 = squeeze(mag5);
[mag8, phase8, wout] = bode(w8, t);
mag8 = squeeze(mag8);
semilogx(wout,mag2db(abs(mag5)),'b', wout,mag2db(abs(mag8)),'g', 'LineWidth', 1);
grid on

legend(first_legend, second_legend);
title('ЛАЧХ');
ylabel('Амплитуда, дБ');
xlabel('Частота, Гц');

% ЛФЧХ
subplot(3, 2, 5);
[mag5, phase5, wout] = bode(w5, t);
phase5 = squeeze(phase5);
[mag8, phase8, wout] = bode(w8, t);
phase8 = squeeze(phase8);
semilogx(wout, phase5, 'b', wout, phase8, 'g', 'LineWidth', 1);
grid on

legend(first_legend, second_legend);
title('ЛФЧХ')
ylabel('Фаза, градусы');
xlabel('Частота, Гц');

% Годограф Найквиста
subplot(3, 2, [4, 6]);

t = linspace(-k, k, 100*k);
[re5,im5, wout] = nyquist(w5, t);
re5 = squeeze(re5);
im5 = squeeze(im5);
[re8,im8, wout] = nyquist(w8, t);
re8 = squeeze(re8);
im8 = squeeze(im8);
plot(re5,im5,'b', re8,im8,'g', -1, 0, 'b*', 'LineWidth', 1)
grid on

legend(first_legend, second_legend);
title('Годограф Найквиста')
xlabel('Действительная ось');
ylabel('Мнимая ось');

sgtitle('Колебательные звенья с разной постоянной демпфирования')
saveas(gcf, 'graphics/Колебательные звенья с разной постоянной демпфирования.png');


%% Колебательные звенья с разным коэффициентом демпфирования


w5 = tf(1, [T^2, 2*T*ksi, 1]);
ksi = 0;
w9 = tf(1, [T^2, 2*T*ksi, 1]);
first_legend = 'w5';
second_legend = 'w9';

figure('position', [400, 200, 900, 750])
t = tiledlayout(3, 4);
title(t, "Колебательные звенья с разным коэффициентом демпфирования");

% Реакция на единичное воздействие: step
subplot(3, 2, 1);

[y5, tOut] = step(w5, 4);
y9 = step(w9, 4);
plot(tOut, y5, 'b', tOut, y9, 'g', 'LineWidth', 1);
grid on

legend(first_legend, second_legend);
title('Реакция на единичное воздействие: step')
xlabel('Время, c');
ylabel('x(t)');

% Реакция на единичное воздействие: impulse
subplot(3, 2, 2);

[y5, tOut] = impulse(w5, 4);
y9 = impulse(w9, 4);
plot(tOut, y5, 'b', tOut, y9, 'g', 'LineWidth', 1);
grid on

legend(first_legend, second_legend);
title('Реакция на импульсное воздействие: impulse');
xlabel('Время, c');
ylabel('x(t)');

% ЛАЧХ
subplot(3, 2, 3);

k = 100;
t = linspace(-k, k, 10*k);
[mag5, phase5, wout] = bode(w5, t);
mag5 = squeeze(mag5);
[mag9, phase9] = bode(w9, t);
mag9 = squeeze(mag9);
semilogx(wout,mag2db(abs(mag5)),'b', wout,mag2db(abs(mag9)),'g', 'LineWidth', 1);
grid on

legend(first_legend, second_legend);
title('ЛАЧХ');
ylabel('Амплитуда, дБ');
xlabel('Частота, Гц');

% ЛФЧХ
subplot(3, 2, 5);

[mag5, phase5, wout] = bode(w5, t);
phase5 = squeeze(phase5);
[mag9, phase9] = bode(w9, t);
phase9 = squeeze(phase9);
semilogx(wout, phase5, 'b', wout, phase9, 'g', 'LineWidth', 1);
grid on

legend(first_legend, second_legend);
title('ЛФЧХ')
ylabel('Фаза, градусы');
xlabel('Частота, Гц');

% Годограф Найквиста
subplot(3, 2, [4, 6]);

k = 1000;
t = linspace(-k, k, 100*k);
[re5,im5] = nyquist(w5, t);
re5 = squeeze(re5);
im5 = squeeze(im5);
t = linspace(-k, k, 2*k);
[re9,im9] = nyquist(w9, t);
re9 = squeeze(re9);
im9 = squeeze(im9);
plot(re5,im5,'b', re9,im9,'g', -1, 0, 'b*', 'LineWidth', 1)
grid on

legend(first_legend, second_legend);
title('Годограф Найквиста')
xlabel('Действительная ось');
ylabel('Мнимая ось');


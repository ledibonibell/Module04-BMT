function my_nyquist(sys, w)
% Получаем АЧХ и ФЧХ системы для частот w
[mag, phase] = bode(sys, w);
magnitude = squeeze(mag);
phase_deg = squeeze(phase);

% Преобразуем ФЧХ в радианы
phase_rad = phase_deg * (pi/180);

% Вычисляем годограф
real_part = magnitude .* cos(phase_rad);
imag_part = magnitude .* sin(phase_rad);

% Строим годограф
plot(real_part, imag_part, '-b', real_part, -imag_part, '-b');
title('Годограф АЧХ');
xlabel('Re(G(jw))');
ylabel('Im(G(jw))');
grid on;
end

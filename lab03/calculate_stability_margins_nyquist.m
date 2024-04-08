% circle params
radius = 1;
circle_center = [0, 0];

% using my_nyquist function, 'cause it's cool :-)
[re, im, w] = nyquist(sys, w);

% координатная дельта между центром круга и точкой
delta_cc = [re - circle_center(1)
            im - circle_center(2)];

% расстояние между точкой и окружностью
distance = abs((delta_cc(1,:).^2 + delta_cc(2,:).^2).^(0.5) - radius);

% поиск запаса фазовой устойчивости по наименьшему расстоянию
[minimum, pha_sm_index] = min(distance); 
re_smp1 = re(pha_sm_index);
im_smp1 = im(pha_sm_index);
w_smp1 = w(pha_sm_index);
% нашли точку, лежащую на окружности (её координаты и частоту)

%  поиск запаса устойчивости амплитуды
abs_im = abs(im);
mag_sm_index = 0;
% ищем пересечение с абсциссой
a=squeeze(size(abs_im));
for n = 2:1000
    if ((im(n) * im(n-1)) <= 0)
        if (abs(im(n)) < abs(im(n-1)))
            mag_sm_index = n;
        else
            mag_sm_index = n-1;
        end
        break
    end
end

re_smp2 = re(mag_sm_index);
im_smp2 = im(mag_sm_index);
w_smp2 = w(mag_sm_index);
% нашли точку, лежащую на оси Re (её координаты и частоту)

% точки на диаграмме Найквиста
y_text_margin  = 0.05;
x_text_margin  = 0.03;
hold on
plot (re_smp1,im_smp1 , 'MarkerSize', 20,'Color',"r")
phase_stability_margin = abs(rad2deg((asin(im_smp1))));
label = strcat("Угол:", num2str(phase_stability_margin));
text(re_smp1 + x_text_margin, im_smp1 + y_text_margin, label, "fontsize", 10)
hold off
hold on
plot (re_smp2, im_smp2 , 'MarkerSize', 20, 'Color',"r")
mag_stability_margin = mag2db(abs(re_smp2));
label = strcat("Амплитуда:", num2str(mag_stability_margin));
text(re_smp2 + x_text_margin, im_smp2 + y_text_margin, label, "fontsize", 10)
hold off

pause
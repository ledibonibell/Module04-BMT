params;

%% Годограф Михайлова k = 0

figure('Name', 'Годограф Михайлова при k = 0');

w=0.001:0.01:10;
GM=freqs(A_1, 1, w);
U=real(GM);
V=imag(GM);
plot(U,V); 
hold on
plot(0,0,'r+');
grid on
xlabel('Re, sec^-^1')
ylabel('Im, sec^-^1')
title('Годограф Михайлова при k = 0');
saveas(gcf, 'graphics/Максимальная устойчивость.png');


%% Годограф Михайлова на границе устойчивости

figure('Name', 'Годограф Михайлова на границе устойчивости');

w=0.001:0.01:10;
GM=freqs(A_2, 1, w);
U=real(GM);
V=imag(GM);
plot(U,V); 
hold on
plot(0,0,'r+');
grid on
xlabel('Re, sec^-^1')
ylabel('Im, sec^-^1')
title('Годограф Михайлова на границе устойчивости (k = k_к = 7.145)');
saveas(gcf, 'graphics/Граничная устойчивость.png');


%% Граница области устойчивости

figure('Name', 'Граница области устойчивости');
T=[0.1, 0.5, 0.7, 0.9,  1.3, 1.7, 2.1 ,2.5, 3, 3.5, 4, 4.5, 5];
k=[7.15, 2.15, 1.80, 1.60, 1.38, 1.26, 1.19, 1.14, 1.10, 1.07, 1.05, 1.03, 1.02];

plot(T,k);
hold on
plot(0.7,0.1,'r*');  
plot(1.7,3.0,'b*');
plot(1.7,1.26,'g*');
grid on
xlabel('T, sec')
ylabel('Kкр')
title('Граница устойчивости системы');
legend('Граница устойчивости', 'Система устойчива', 'Система не устойчива', 'Система на границе устойчивости')
saveas(gcf, 'graphics/Граница области.png');


%% Ниже границы устойчивости

name = 'Устойчивая система (ниже границы устойчивости)';
road = 'graphics/Устойчивая система.png';
color = 'r-';
road1 = 'graphics/Устойчивая система Михайлов.png';
lab_otu_dynamic_plot(T_3, k_31, T1, k1, name, road, color, road1);


%% Выше границы устойчивости

name = 'Неустойчивая система (выше границы устойчивости)';
road = 'graphics/Неустойчивая система.png';
road1 = 'graphics/Неустойчивая система Михайлов.png';
color = 'b-';
lab_otu_dynamic_plot(T_3, k_32, T1, k1, name, road, color, road1);


%% На границе устойчивости

name = 'Система на границе устойчивости';
road = 'graphics/На границе устойчивости.png';
color = 'g-';
road1 = 'graphics/На границе устойчивости Михайлов.png';
lab_otu_dynamic_plot(T_31, k_33, T1, k1, name, road, color, road1);


%% Все вместе

figure('Name', 'Годограф Михайлова с разной устойчивостью');

w = 0.001:0.01:10;

GM1 = freqs([T1*T_3, T1+T_3,1, k_31*k1], 1, w);
GM2 = freqs([T1*T_3, T1+T_3,1, k_32*k1], 1, w);
GM3 = freqs([T1*T_31, T1+T_31,1, k_33*k1], 1, w);

U1 = real(GM1);
V1 = imag(GM1);

U2 = real(GM2);
V2 = imag(GM2);

U3 = real(GM3);
V3 = imag(GM3);

plot(U1, V1, 'r', U2, V2, 'b', U3, V3, 'g');

hold on
plot(0,0,'r+');
grid on
legend('Устойчивая система', 'Неустойчивая система', 'Система на границе устойчивости')
xlabel('Re, sec^-^1')
ylabel('Im, sec^-^1')
title('Годограф Михайлова с разной устойчивостью');
saveas(gcf, 'graphics/Разная устойчивость.png');

T = 5;
K = 10;
T1 = 3;
T2 = 1.1;
ksi = 0.25;


% Создание передаточных функций для различных типовых звеньев
W1 = tf(K);                         % усилитель  k              
W2 = tf(1, [1, 0]);                 % интегрирующее 1/s
W3 = tf(1, [T, 1]);                 % апер. 1 п. 1/(Ts+1)
W4 = tf([5, 1], 1);                 % реал. дифф. 1 п. (Ts+1)

% колебательные 1/(T^2+2T*ksi+1)
W5 = tf(1, [T*T, 2*T*ksi, 1]);      % со значением T, ksi
W6 = tf(1, [T1*T1, 2*T1*ksi, 1]);   % со значением T1, ksi
W7 = tf(1, [T*T, T*ksi, 1]);        % со значением T, ksi/2
W8 = tf(1, [T2*T2, 2*T1*ksi, 1]);   % со значением T1, T2, ksi
W9 = tf(1, [T*T, 0, 1]);            % консервативное звено ksi=0


% Построение графиков для каждого звена
plot_diagrams(W1, 'Усилительное звено', 'graphics/Усилительное звено.png');
plot_diagrams(W2, 'Интегрирующее звено', 'graphics/Интегрирующее звено.png');
plot_diagrams(W3, 'Апериодическое звено', 'graphics/Апериодическое звено.png');
plot_diagrams_4(W4, 'Реально дифференцирующее звено', 'graphics/Реально дифференцирующее звено.png');
plot_diagrams_5(W5, W6, 'Колебательные звенья с разным коэффициентом усиления', 'graphics/Колебательные звенья с разным коэффициентом усиления.png');
plot_diagrams_5(W5, W7, 'Колебательные звенья с разной постоянной времени', 'graphics/Колебательные звенья с разной постоянной времени.png');
plot_diagrams_5(W5, W8, 'Колебательные звенья с разным коэффициентом демпфирования', 'graphics/Колебательные звенья с разным коэффициентом демпфирования.png');
plot_diagrams_5(W5, W9, 'Колебательное звено с консервативным', 'graphics/Колебательное звено с консервативным.png');


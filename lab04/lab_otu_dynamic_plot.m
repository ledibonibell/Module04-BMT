function lab_otu_dynamic_plot(T, k, T1, k1, graph, road, color, biba)

B = k*k1;
A = [T1*T, T1+T,1, k*k1];
W = tf(B, A);

    if ~iscell(W)
        W = {W};
    end

figure('Position', [400, 200, 900, 750]);

    title(graph)

subplot(3,2,1)

for k = 1 : 1 : length(W)
 if isproper(W{k})
   [x,t]=step(W{k}, 0:0.1:30);
   plot(t, x, color);
   hold on;
 end
end

hold off
    grid minor
    grid on;
    title('Step Response')
    xlabel('time, sec')
    ylabel('Magnitude, dB')
subplot(3,2,2)

for k = 1 : 1 : length(W)
 if isproper(W{k})
   [x,t]=impulse(W{k}, 0:0.1:30);
   plot(t, x, color);
   hold on;
 end
end

hold off
    grid minor
    grid on;
    title('Impulse Response')
    xlabel('time, sec')
    ylabel('Magnitude, dB')
    subplot(3,2,[3,5])
   
for k = 1 : 1 : length(W)
 if isproper(W{k})
        hold on;
   bode(W{k}, color);
   grid on;
 end
end
   hold off;
 subplot(3,2,4)

for k = 1 : 1 : length(W)
 if isproper(W{k})
        hold on;
   nyquist(W{k}, color);
 end
end

hold off
    grid minor
    grid on;
    title('Nyquist Diagram')
    xlabel('Real Axis, sec^-^1')
    ylabel('Imaginary Axis, sec^-^1')

 hold off;
 subplot(3,2,6)

for k = 1 : 1 : length(W)
 if isproper(W{k})
    pzmap(W{k}, color);
    title('Pole-Zero Map');
    axis([-3 2 -2 2]);
 end
end



saveas(gcf, road);

figure('Name', 'Годограф Михайлова');

w=0.001:0.01:10;
GM=freqs(A, 1, w);
U=real(GM);
V=imag(GM);
plot(U,V, color); 
hold on
plot(0,0, 'r+');
grid on
xlabel('Re, sec^-^1')
ylabel('Im, sec^-^1')
title(graph);
saveas(gcf, biba);

end



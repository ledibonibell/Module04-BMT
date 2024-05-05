function lab_otu_dynamic_plot(T, k, T1, k1, graph, road, color)

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
 subplot(3,2,[4,6])

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

saveas(gcf, road);
end



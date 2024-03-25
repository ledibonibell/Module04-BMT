function graphic(model, zero, uptitle, name)

% model - equation with 1(t) or 2 * sin(t)
% zero - initional conditions
% uptitle - titles
% name - name of plot in directory

options;
ode_opts = odeset('AbsTol',[1e-5,1e-5,1e-5],'RelTol',1e-5);


[time, x] = ode45(model, [0, T], zero, ode_opts);
figure;
plot(time, x(:,1), 'b-', time, x(:,2), 'g--', 'LineWidth', 1);

legend('x_1(t)', 'x_2(t)');

title(uptitle);
xlabel('time (25 seconds)');
ylabel('signals');

grid on;
saveas(gcf, name);
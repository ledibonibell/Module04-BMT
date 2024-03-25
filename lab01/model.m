function xi = model(t, x, y)
options;

disp(t);
xi = zeros(3, 1);

in = y(t);
xi(1) = x(2);
xi(2) = x(3);
xi(3) = b0 * in - a2 * x(3) - a1 * x(2) - a0 * x(1);
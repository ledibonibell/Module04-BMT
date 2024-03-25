options;
ode_opts = odeset('AbsTol',[1e-5,1e-5,1e-5],'RelTol',1e-5);

y = @(t) 1;
y_sin = @(t) 2 * sin(t);

model_1 = @(t, x) model(t, x, y);
model_sin = @(t, x) model(t, x, y_sin);


graphic(model_1, x_zero, 'y_1 = 1(t) - zero', 'graphics/signal - 1 - zero.png');
graphic(model_1, x_nonzero, 'y_1 = 1(t) - nonzero', 'graphics/signal - 1 - nonzero.png');

graphic(model_sin, x_zero, 'y_2 = 2sin(t) - zero', 'graphics/signal - sin - zero.png')
graphic(model_sin, x_nonzero, 'y_2 = 2sin(t) - nonzero', 'graphics/signal - sin - nonzero.png')


pause
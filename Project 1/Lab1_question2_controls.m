% System parameters
m = 10;    % mass (kg)
b = 1;     % damping coefficient (Ns/m)
k = 10;    % spring constant (N/m)

% Derived quantities
decay = 0.05;                 % decay rate (1/s)
omega_d = sqrt(3.99) / 2;     % damped natural frequency (rad/s)

% Initial conditions
% x(0) = 1 m, x'(0) = 0 m/s
A = 1;
B = decay / omega_d;

% Time vector
t = 0:0.01:100;               % time span (s)

% Damped harmonic motion solution
x = exp(-decay .* t) .* ...
    (A * cos(omega_d .* t) + B * sin(omega_d .* t));

% Plot response
figure;
plot(t, x, 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Displacement (m)');
title('Damped Harmonic Oscillator Response');
grid on;

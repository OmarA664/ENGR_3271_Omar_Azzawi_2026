% Constants
m = 5;      % kg
b = 1;      % N*s/m
k = 5;      % N/m

% Natural frequencies (undamped) for this symmetric 2-DOF setup
w1 = sqrt(k/m);
w2 = sqrt(3*k/m);

% Choose forcing frequency (choose w1 or w2)
omega = w1;

% Input u(t) = sin(omega t)
u = @(t) sin(omega*t);

% ODE state: x = [q1; q1dot; q2; q2dot]
odefun = @(t,x) coupledODE(t, x, m, b, k, omega);

% Simulation time + initial conditions
tspan = [0 60];
x0 = [0; 0; 0; 0];

% Solve
opts = odeset('RelTol',1e-8,'AbsTol',1e-10);
[t,x] = ode45(odefun, tspan, x0, opts);

q1 = x(:,1);
q2 = x(:,3);
ut = u(t);

% Plot displacements + input
figure;
plot(t, q1, 'LineWidth', 1.5); hold on;
plot(t, q2, 'LineWidth', 1.5);
plot(t, ut, '--', 'LineWidth', 1.2);
grid on;
xlabel('Time (s)');
ylabel('Displacement (m)');
legend('q_1(t)','q_2(t)','u(t)=sin(\omega t)');
title(sprintf('Coupled masses response, \\omega = %.3f rad/s', omega));

% Relative displacement
figure;
plot(t, q2 - q1, 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('q_2 - q_1 (m)');
title('Relative displacement between masses');

% ---- local function (keeps the main script cleaner) ----
function dx = coupledODE(t, x, m, b, k, omega)
    q1  = x(1);  q1d = x(2);
    q2  = x(3);  q2d = x(4);

    ut = sin(omega*t);

    q1dd = (-b*q1d - 2*k*q1 + k*q2) / m;
    q2dd = (-b*q2d + k*q1 - 2*k*q2 + k*ut) / m;

    dx = [q1d; q1dd; q2d; q2dd];
end

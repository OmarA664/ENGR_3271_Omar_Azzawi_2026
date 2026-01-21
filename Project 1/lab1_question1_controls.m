% Pendulum parameters
mass = 10;          % mass (kg)
length = 5;         % pendulum length (m)
gravity = 9.81;     % gravitational acceleration (m/s^2)

% Initial condition
theta_deg = 90;                    % initial angle (degrees)
theta_rad = deg2rad(theta_deg);   % convert to radians

% Time and frequency
omega_n = sqrt(gravity / length);   % natural frequency (rad/s)
time = linspace(0, 10, 500);        % time vector

% Linearized pendulum response
theta_rad = theta_rad * cos(omega_n * time);
theta_deg = rad2deg(theta_rad);     % convert back to degrees

% Plot pendulum motion
figure;
plot(time, theta_deg, 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Angle (degrees)');
title('Linearized Pendulum Response (\theta_0 = 90^\circ)');
grid on;

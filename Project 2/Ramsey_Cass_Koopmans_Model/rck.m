%% Ramsey-Cass-Koopmans model

% parameters
delta=0.1;        % depreciation rate
n=0.01;           % population change rate
rho=0.02;         % rate of time preference
sigma=1.1;        % intertemporal elasticity of substitution

% 1.a) 
ep=fsolve(@(y) [((5*y(1))/(1+3*y(1)))-(n+delta)*y(1)-y(2);...
                y(2)*((5/(1+3*y(1))^2)-(rho+delta+n))*sigma], [0.05;0.0044518277]);
fprintf('The equilibrium is %g \n', ep)
disp('-------------//--------------')

% 1.b)
figure(1)
[t y]=ode45(@(t,y) [((5*y(1))/(1+3*y(1)))-(n+delta)*y(1)-y(2); ... 
                    y(2)*((5/(1+3*y(1))^2)-(rho+delta+n))*sigma], [0,20], [0.05,0.044518277]);
plot(t,y)
title('Transition Dynamics | [k0, c0] = [0.05, 0.044518277] in the interval [0, 20]')
legend('Per Capita Capital (k)','Per Capita Consumption (c)','location','northwest')
xlabel('t')


% 2.a)
disp(' ')
ep2a=fsolve(@(y) [((5*y(1))/(1+3*y(1)))-(n+delta)*y(1)-y(2);...
                    y(2)*((5/(1+3*y(1))^2)-(rho+delta+n))*sigma], [2.55,1.509891]);
fprintf('The equilibrium in 2.a) is %g \n', ep2a)
disp('-------------//--------------')
figure(2)
[t y]=ode45(@(t,y) [((5*y(1))/(1+3*y(1)))-(n+delta)*y(1)-y(2); ...
                    y(2)*((5/(1+3*y(1))^2)-(rho+delta+n))*sigma], [0,35], [2.55;1.509891]);
subplot(2,3,1)
plot(t,y)
title('Transition Dynamics | [k0, c0] = [2.55, 1.509891] in the interval [0, 35]')
legend('Per Capita Capital (k)','Per Capita Consumption (c)','location','northwest')
xlabel('t')

% 2.b)
disp(' ')
ep2b=fsolve(@(y) [((5*y(1))/(1+3*y(1)))-(n+delta)*y(1)-y(2);...
                    y(2)*((5/(1+3*y(1))^2)-(rho+delta+n))*sigma], [1,0.5]);
fprintf('The equilibrium in 2.b) is %g \n', ep2b)
disp('-------------//--------------')
[t y]=ode45(@(t,y) [((5*y(1))/(1+3*y(1)))-(n+delta)*y(1)-y(2);...
                      y(2)*((5/(1+3*y(1))^2)-(rho+delta+n))*sigma], [0,50], [1,0.5]);
subplot(2,3,3)
plot(t,y)
title('Transition Dynamics | [k0, c0] = [1, 0.5] in the interval [0, 50]')
legend('Per Capita Capital (k)','Per Capita Consumption (c)','location','northwest')
xlabel('t')

% 2.c)
disp(' ')
ep2c=fsolve(@(y) [((5*y(1))/(1+3*y(1)))-(n+delta)*y(1)-y(2);...
                    y(2)*((5/(1+3*y(1))^2)-(rho+delta+n))*sigma], [0.05,0.1]);
fprintf('The equilibrium in 2.c) is %g \n', ep2c)
disp('-------------//--------------')
[t y]=ode45(@(t,y) [((5*y(1))/(1+3*y(1)))-(n+delta)*y(1)-y(2);...
                      y(2)*((5/(1+3*y(1))^2)-(rho+delta+n))*sigma], [0,0.5], [0.05,0.1]);
subplot(2,3,5)
plot(t,y)
title('Transition Dynamics | [k0, c0] = [0.05, 0.1] in the interval [0, 0.5]')
legend('Per Capita Capital (k)','Per Capita Consumption (c)','location','northwest')
xlabel('t')

% cutting the interval of 2.a)
figure(3)
[t y]=ode45(@(t,y) [((5*y(1))/(1+3*y(1)))-(n+delta)*y(1)-y(2); ...
                    y(2)*((5/(1+3*y(1))^2)-(rho+delta+n))*sigma], [0,12], [2.55;1.509891]);
plot(t,y)
title('Transition Dynamics | [k0, c0] = [2.55, 1.509891] in the interval [0, 12]')
legend('Per Capita Capital (k)','Per Capita Consumption (c)','location','northwest')
xlabel('t')


% 3 - eig(M)
ep=fsolve(@(y) [((5*y(1))/(1+3*y(1)))-(n+delta)*y(1)-y(2);...
                  y(2)*((5/(1+3*y(1))^2)-(rho+delta+n))*sigma], [0.05;0.0044518277]);
k=ep(1);
c=ep(2);
f_2der=(-30/(1+3*k)^3);
Jac= @(y) [rho -1; sigma*f_2der*c 0];
M=Jac(ep);
stab=eig(M);
disp(' ')
fprintf('The eigenvalues of the Jacobian matrix is %g \n', stab)
disp('-------------//--------------')

% 4.a) Shock on the depreciation rate | delta=0.2
delta2=0.2;       % depreciation rate
n=0.01;           % population change rate
rho=0.02;         % rate of time preference
sigma=1.1;        % intertemporal elasticity of substitution

ep4=fsolve(@(y) [((5*y(1))/(1+3*y(1)))-(n+delta2)*y(1)-y(2);...
                    y(2)*((5/(1+3*y(1))^2)-(rho+delta2+n))*sigma], [0.05;0.0044518277]);
disp(' ')
fprintf('The equilibrium when delta doubles is %g \n', ep4)
disp('-------------//--------------')

figure(4)
[t y]=ode45(@(t,y) [((5*y(1))/(1+3*y(1)))-(n+delta2)*y(1)-y(2);...
                      y(2)*((5/(1+3*y(1))^2)-(rho+delta2+n))*sigma], [0,20], [0.05,0.044518277]);
plot(t,y)
title('Shock on delta (0.2) | Transition Dynamics | [k0, c0] = [0.05, 0.044518277] in the interval [0, 20]')
legend('Per Capita Capital (k)','Per Capita Consumption (c)','location','northwest')
xlabel('t')

% 4.b) Shock on the rate of time preference | rho=0.04
delta=0.1;         % depreciation rate
n=0.01;            % population change rate
rho2=0.04;         % rate of time preference
sigma=1.1;         % intertemporal elasticity of substitution

ep5=fsolve(@(y) [((5*y(1))/(1+3*y(1)))-(n+delta)*y(1)-y(2);...
                   y(2)*((5/(1+3*y(1))^2)-(rho2+delta+n))*sigma], [0.05;0.0044518277]);
disp(' ')
fprintf('The equilibrium when rho doubles is %g \n', ep5)
disp('-------------//--------------')

figure(5)
[t y]=ode45(@(t,y) [((5*y(1))/(1+3*y(1)))-(n+delta)*y(1)-y(2);...
                      y(2)*((5/(1+3*y(1))^2)-(rho2+delta+n))*sigma], [0,20], [0.05,0.044518277]);
plot(t,y)
title('Shock on rho (0.04) | Transition Dynamics | [k0, c0] = [0.05, 0.044518277] in the interval [0, 20]')
legend('Per Capita Capital (k)','Per Capita Consumption (c)','location','northwest')
xlabel('t')


%% 5. Further Analysis - Shocks on the intertemporal elasticity of substitution (sigma) - [k0, c0] = [2.55, 1.509891] in the interval [0, 12]

% 5.a) Negative shock on sigma of 0.2
delta=0.1;         % depreciation rate
n=0.01;            % population change rate
rho=0.02;          % rate of time preference
sigma2=0.9;        % intertemporal elasticity of substitution
 
ep7=fsolve(@(y) [((5*y(1))/(1+3*y(1)))-(n+delta)*y(1)-y(2);...
                    y(2)*((5/(1+3*y(1))^2)-(rho+delta+n))*sigma2], [2.55;1.509891]);
disp(' ')
fprintf('The equilibrium when sigma is 0.9 is %g \n', ep7)
disp('-------------//--------------')

figure(6)
[t y]=ode45(@(t,y) [((5*y(1))/(1+3*y(1)))-(n+delta)*y(1)-y(2);...
                      y(2)*((5/(1+3*y(1))^2)-(rho+delta+n))*sigma2], [0,12], [2.55;1.509891]);
subplot(2,1,1)
plot(t,y)
title('New Sigma=0.9 | Transition Dynamics | [k0, c0] = [2.55, 1.509891] in the interval [0, 12]')
legend('Per Capita Capital (k)','Per Capita Consumption (c)','location','northwest')
xlabel('t')

% 5.a) Positive shock on sigma of 0.2
delta=0.1;        % depreciation rate
n=0.01;           % population change rate
rho=0.02;         % rate of time preference
sigma3=1.3;       % intertemporal elasticity of substitution
 
ep8=fsolve(@(y) [((5*y(1))/(1+3*y(1)))-(n+delta)*y(1)-y(2);...
                   y(2)*((5/(1+3*y(1))^2)-(rho+delta+n))*sigma3], [2.55;1.509891]);
disp(' ')
fprintf('The equilibrium when sigma is 1.3 is %g \n', ep8)
disp('-------------//--------------')

[t y]=ode45(@(t,y) [((5*y(1))/(1+3*y(1)))-(n+delta)*y(1)-y(2);...
                      y(2)*((5/(1+3*y(1))^2)-(rho+delta+n))*sigma3], [0,12], [2.55;1.509891]);
subplot(2,1,2)
plot(t,y)
title('New Sigma=1.3 | Transition Dynamics | [k0, c0] = [k0, c0] = [2.55, 1.509891] in the interval [0, 12]')
legend('Per Capita Capital (k)','Per Capita Consumption (c)','location','northwest')
xlabel('t')

%% 5.b) Mankiw-Romer-Weil version of the Solow-Swan model
% k = s(k)*(k^alfa)*(h^beta) - (n+g+sigma)*k
% h = s(h)*(k^alfa)*(h^beta) - (n+g+sigma)*h
% k = y(1)
% h = y(2)

% parameters
sigma = 0.1;     % depreciation rate - Mankin G., Romer D., and Weil D. (1992, p.410)
n = 0.02;        % population growth rate - Mankin G., Romer D., and Weil D. (1992, p.411)
g = 0.02;        % advancement of knowledge rate - Mankin G., Romer D., and Weil D. (1992, p.410)
alfa = 0.60;     % physical capital share in income - According to Mankin G., Romer D., and Weil D. (1992, p.416), alfa+beta<1 implies that there are decreasing returns to all capital.
beta = 0.25;     % human capital share in income - ""
s_k = 0.65;      % fraction of the capital invested in physical capital - Mankin G., Romer D., and Weil D. (1992, p.416)
s_h = 0.35;      % fraction of the capital invested in human capital - Mankin G., Romer D., and Weil D. (1992, p.416)
s = s_k+s_h;     % sum of previous fractions - (Wikipedia, n.d.)

% dsplay parameters
disp(' ')
disp(' ')
disp('Mankiw-Romer-Weil version of the Solow-Swan model (parameters):')
disp('===============================================================')
fprintf('Depreciation rate:   %g \n', sigma)
disp('----------------------------')
fprintf('Population growth rate:   %g \n', n)
disp('----------------------------')
fprintf('Advancement of knowledge rate:   %g \n', g)
disp('----------------------------')
fprintf('Physical capital share in income:   %g \n', alfa)
disp('----------------------------')
fprintf('Human capital share in income:   %g \n', beta)
disp('----------------------------')
fprintf('Fraction of the capital invested in physical capital:   %g \n', s_k)
disp('----------------------------')
fprintf('Fraction of the capital invested in human capital:   %g \n', s_h)
disp('----------------------------')
fprintf('Sum of previous capital:   %g \n', s)
disp('----------------------------')

% find the equilibrium
ep = fsolve (@(y) [s_k*(y(1)^alfa)*(y(2)^beta) - (n+g+sigma)*y(1);...
                   s_h*(y(1)^alfa)*(y(2)^beta) - (n+g+sigma)*y(2)], [0.01;0.01]);

% show the results
disp(' ')
fprintf('The physical capital equilibrium is %g \nThe human capital equilibrium is %g \n', ep(1), ep(2))

% tranition dynamics to the steady state
[t y]=ode45(@(t,y) [s_k*(y(1)^alfa)*(y(2)^beta) - (n+g+sigma)*y(1);...
                s_h*(y(1)^alfa)*(y(2)^beta) - (n+g+sigma)*y(2)], [0,20], [0.01,0.01]);

% plot the transition dynamics
figure(7)       
plot(t,y)
title('Transition Dynamics Mankiw-Romer-Weil')
xlabel('t')
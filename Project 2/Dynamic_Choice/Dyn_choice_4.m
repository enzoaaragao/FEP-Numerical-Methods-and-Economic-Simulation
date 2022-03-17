% Dynamic choice on a finite horizon

% New flow equation: introducing the cobb-douglas production function
% parameters
beta = 0.9;     % discount factor
T = 10;         % time span
k1 = 100;       % initial capital
npoints = 400;  % nb.points in the grid search
theta = 1.2;    % time-invariant technology parameter
alpha = 0.99;   % output elastiscity of capital

% display new parameters
disp('New Parameters:')
fprintf('Theta =    %g \nAlpha =   %g \n', theta, alpha)

k = linspace(0, k1, npoints+1);               % set all values for K
V = [NaN(length(k), T), zeros(length(k), 1)]; % prealocate V

% backward: grid search (loop over possible values of k(t) and k(t+1))
aux = NaN(length(k), length(k), T);
for t = T:-1:1       
    for in = 1:length(k)
        for out = 1:in
            c = k(in)-(k(out)/theta)^(1/alpha);
            aux(in, out, t) = log(c)+beta*V(out, t+1);
        end
    end
    V(:,t) = max(aux(:,:,t), [], 2); % get the maximun by columns
end

% forward: compute optimal results
vf = NaN(T, 1);             % prealocate value function 
capital = [k1; NaN(T, 1)];  % prealocate capital
nconsumption = NaN(T, 1);   % prealocate new consumption
for t = 1:T
    vf(t) = V(k==capital(t), t);
    capital(t+1) = k(aux(k==capital(t), :, t)==vf(t));
    nconsumption(t) = capital(t)-(capital(t+1)/theta)^(1/alpha);
    p(t) = capital(t+1)-capital(t)+nconsumption(t);
end

production=p';
% show results
pkg load tablicious                       % Load the pkg that formulates the table
Table = {'t','capital','consumption','production'};
t = [1;2;3;4;5;6;7;8;9;10];
capital = capital(1:T);
consumption = nconsumption;
production = production;
disp(' ')
disp('Introducing the Cobb-Douglas Production Function')
tab = table (t, capital, consumption, production);
prettyprint (tab)

% comparing solutions with the two different flow equations
subplot(2,2,1)
% consumption and capital and production
liqconsumption = nconsumption-production;
plot(1:T, [liqconsumption, capital(1:T)])
title('New flow equation (Cobb-Douglas Production Function)')
xlabel('time');
legend('Liquid Consumption', 'Capital')

subplot(2,2,3)
% value function
plot(1:T, vf, 'm');
title('New flow equation (Cobb-Douglas Production Function)')
xlabel('time');
legend('Value Function')

% old flow equation

% parameters
beta = 0.9;     % discount factor
T = 10;         % time span
k1 = 100;       % initial capital
npoints = 400;  % nb.points in the grid search

k = linspace(0, k1, npoints+1);               % set all values for K
V = [NaN(length(k), T), zeros(length(k), 1)]; % prealocate V

% backward: grid search (loop over possible values of k(t) and k(t+1))
aux = NaN(length(k), length(k), T);
for t = T:-1:1       
    for in = 1:length(k)
        for out = 1:in
            c = k(in)-k(out);
            aux(in, out, t) = log(c)+beta*V(out, t+1);
        end
    end
    V(:,t) = max(aux(:,:,t), [], 2); % get the maximun by columns
end

% forward: compute optimal results
vf = NaN(T, 1);             % prealocate value function 
capital = [k1; NaN(T, 1)];  % prealocate capital
consumption = NaN(T, 1);    % prealocate consumption
for t = 1:T
    vf(t) = V(k==capital(t), t);
    capital(t+1) = k(aux(k==capital(t), :, t)==vf(t));
    consumption(t) = capital(t)-capital(t+1);
end

subplot(2,2,2)
% consumption and capital
plot(1:T, [consumption, capital(1:T)])
title('Old flow equation (agent only consumes)')
xlabel('time');
legend('Consumption', 'Capital')

subplot(2,2,4)
% value function
plot(1:T, vf, 'm');
title('Old flow equation (agent only consumes)')
xlabel('time');
legend('Value Function')

% comparing gross consumption of the new and old flow equation
% if you have not loaded the pkg tablicious before, please go back to line 44 and execute it
disp(' ')
Table = {'t','NewGrossConsumption','OldGrossConsumption'};
t = [1;2;3;4;5;6;7;8;9;10];
NewGrossConsumption = nconsumption;
OldGrossConsumption = consumption;
disp('Comparing gross consumption of the new and old flow equation:')
tab = table (t, NewGrossConsumption, OldGrossConsumption);
prettyprint (tab)
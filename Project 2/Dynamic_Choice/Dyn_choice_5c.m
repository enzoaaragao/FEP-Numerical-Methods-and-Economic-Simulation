% Dynamic choice on a finite horizon

% How theta impact the old model?
% parameters
beta = 0.9;     % discount factor
T = 10;         % time span
k1 = 100;       % initial capital
npoints = 400;  % nb.points in the grid search
theta = 1.25;   % time-invariant technology parameter

k = linspace(0, k1, npoints+1);               % set all values for K
V = [NaN(length(k), T), zeros(length(k), 1)]; % prealocate V

% backward: grid search (loop over possible values of k(t) and k(t+1))
aux = NaN(length(k), length(k), T);
for t = T:-1:1       
    for in = 1:length(k)
        for out = 1:in
            c = k(in)-(k(out)/theta);
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
    consumption(t) = capital(t)-(capital(t+1)/theta);
    p(t) = capital(t+1)-capital(t)+consumption(t);
end

production=p';
% show results
pkg load tablicious                       % Load the pkg that formulates the table
Table = {'t','capital','consumption','production'};
t = [1;2;3;4;5;6;7;8;9;10];
capital = capital(1:T);
consumption = consumption;
production = production;
disp('The impact of theta on the old model')
tab = table (t, capital, consumption, production);
prettyprint (tab)

subplot(2,1,1)
% consumption and capital and production
plot(1:T, [consumption, capital(1:T), production])
title('The impact of theta on the old model')
xlabel('time');
legend('Consumption', 'Capital', 'Production')


% How alpha impact the model with Cobb-Douglas? (theta=1.25)
% parameters
beta = 0.9;     % discount factor
T = 10;         % time span
k1 = 100;       % initial capital
npoints = 400;  % nb.points in the grid search
theta = 1.25;   % time-invariant technology parameter
alpha = 0.98;   % output elastiscity of capital

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
consumption = NaN(T, 1);    % prealocate consumption
for t = 1:T
    vf(t) = V(k==capital(t), t);
    capital(t+1) = k(aux(k==capital(t), :, t)==vf(t));
    consumption(t) = capital(t)-(capital(t+1)/theta)^(1/alpha);
    p(t) = capital(t+1)-capital(t)+consumption(t);
end

production=p';
% show results
% if you have not loaded the pkg tablicious before, please go back to line 39 and execute it
Table = {'t','capital','consumption','production'};
t = [1;2;3;4;5;6;7;8;9;10];
capital = capital(1:T);
consumption = consumption;
production = production;
disp(' ')
disp('The impact of alpha on the model with Cobb-Douglas (theta=1.25)')
tab = table (t, capital, consumption, production);
prettyprint (tab)

subplot(2,1,2)
% consumption and capital and production
plot(1:T, [consumption, capital(1:T), production])
title('The impact of alpha on the model with Cobb-Douglas (theta=1.25)')
xlabel('time');
legend('Consumption', 'Capital', 'Production')
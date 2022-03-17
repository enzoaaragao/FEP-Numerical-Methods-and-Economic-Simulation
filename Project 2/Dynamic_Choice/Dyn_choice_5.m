%% Dynamic choice on a finite horizon

% Extending the time span from 10 to 20
% parameters
beta = 0.9;     % discount factor
T = 20;         % new time span
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

figure(1)
subplot(2,1,1)
% consumption and capital
plot(1:T, [consumption, capital(2:T+1)])
xlabel('time'); legend('Consumption', 'Capital')
title('Finite Horizon = 20')

subplot(2,1,2)
% value function
plot(1:T, vf, 'm'); xlabel('time'); legend('Value Function')
title('Finite Horizon = 20')

% show results
pkg load tablicious                       % Load the pkg that formulates the table
Table = {'t','capital','consumption'};
t = [1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20];
capital = capital(1:T);
consumption = consumption;
disp('Expanding time horizon from 10 to 20')
tab = table (t, capital, consumption);
prettyprint (tab)


% Cutting the time span from 10 to 6
% parameters
beta = 0.9;     % discount factor
T = 6;         % new time span
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

figure(2)
subplot(2,1,1)
% consumption and capital
plot(1:T, [consumption, capital(2:T+1)])
xlabel('time'); legend('Consumption', 'Capital')
title('Finite Horizon = 6')

subplot(2,1,2)
% value function
plot(1:T, vf, 'm');
xlabel('time'); legend('Value Function')
title('Finite Horizon = 6')

% show results
% if you have not loaded the pkg tablicious before, please go back to line 48 and execute it
Table = {'t','capital','consumption'};
t = [1;2;3;4;5;6];
capital = capital(1:T);
consumption = consumption;
disp(' ')
disp('Cutting time horizon from 10 to 6')
tab = table (t, capital, consumption);
prettyprint (tab)
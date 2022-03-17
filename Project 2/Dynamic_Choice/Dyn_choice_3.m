%% Dynamic choice on a finite horizon

% poitive shock on the initial capital
% parameters
beta = 0.9;     % discount factor
T = 10;         % time span
k1 = 180;       % initial capital
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

% show results
pkg load tablicious                       % Load the pkg that formulates the table
Table = {'t','capital','consumption'};
t = [1;2;3;4;5;6;7;8;9;10];
capital = capital(1:T);
consumption = consumption;
disp('Initial capital = 180')
tab = table (t, capital, consumption);
prettyprint (tab)

subplot(2,2,1)
% consumption and capital
plot(1:T, [consumption, capital])
title('Initial Capital = 180')
xlabel('time');
legend('Consumption', 'Capital')

subplot(2,2,2)
% value function
plot(1:T, vf, 'm');
title('Initial Capital = 180')
xlabel('time');
legend('value function')


% negative shock on the initial capital
% parameters
beta = 0.9;     % discount factor
T = 10;         % time span
k1 = 60;        % initial capital
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

% show results
% if you have not loaded the pkg tablicious before, please go back to line 36 and execute it
Table = {'t','capital','consumption'};
t = [1;2;3;4;5;6;7;8;9;10];
capital = capital(1:T);
consumption = consumption;
disp(' ')
disp('Initial capital = 60')
tab = table (t, capital, consumption);
prettyprint (tab)

subplot(2,2,3)
% consumption and capital
plot(1:T, [consumption, capital])
title('Initial Capital = 60')
xlabel('time'); 
legend('Consumption', 'Capital')

subplot(2,2,4)
% value function
plot(1:T, vf, 'm'); 
title('Initial Capital = 60')
xlabel('time'); 
legend('value function')

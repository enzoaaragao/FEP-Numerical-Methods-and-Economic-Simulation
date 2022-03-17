%% Dependency of the consumption on the discount factor

% beta=0
% parameters
beta = 0;     % discount factor
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

figure(1)
subplot(2,2,1)
% consumption and capital
plot(1:T, [consumption, capital(2:T+1)])
title('Beta equals 0')
xlabel('time'); legend('Consumption', 'Capital')

% show results
pkg load tablicious                       % Load the pkg that formulates the table
Table = {'t','capital','consumption'};
t = [1;2;3;4;5;6;7;8;9;10];
capital = capital(1:T);
consumption = consumption;
disp(' ')
disp('Discount Factor = 0')
tab = table (t, capital, consumption);
prettyprint (tab)

% beta=0.5
% parameters
beta = 0.5;     % discount factor
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
plot(1:T, [consumption, capital(2:T+1)])
title('Beta equals 0.5')
xlabel('time'); legend('Consumption', 'Capital')

% show results 
% if you have not loaded the pkg tablicious before, please go back to line 44 and execute it
Table = {'t','capital','consumption'};
t = [1;2;3;4;5;6;7;8;9;10];
capital = capital(1:T);
consumption = consumption;
disp(' ')
disp('Discount Factor = 0.5')
tab = table (t, capital, consumption);
prettyprint (tab)

% beta=1
% parameters
beta = 1;     % discount factor
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


subplot(2,2,3)
% consumption and capital
plot(1:T, [consumption, capital(2:T+1)])
title('Beta equals 1')
xlabel('time'); legend('Consumption', 'Capital')

% show results
% if you have not loaded the pkg tablicious before, please go back to line 44 and execute it
Table = {'t','capital','consumption'};
t = [1;2;3;4;5;6;7;8;9;10];
capital = capital(1:T);
consumption = consumption;
disp(' ')
disp('Discount Factor = 1')
tab = table (t, capital, consumption);
prettyprint (tab)

% beta=2
% parameters
beta = 2;     % discount factor
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


subplot(2,2,4)
% consumption and capital
plot(1:T, [consumption, capital(2:T+1)])
title('Beta equals 2')
xlabel('time'); legend('Consumption', 'Capital')

% show results
% if you have not loaded the pkg tablicious before, please go back to line 44 and execute it
Table = {'t','capital','consumption'};
t = [1;2;3;4;5;6;7;8;9;10];
capital = capital(1:T);
consumption = consumption;
disp(' ')
disp('Discount Factor = 2')
tab = table (t, capital, consumption);
prettyprint (tab)
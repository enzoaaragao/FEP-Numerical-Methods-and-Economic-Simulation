% Dynamic choice on a finite horizon

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

disp('Table with t, capital and consumption')
% show results
pkg install https://github.com/apjanke/octave-tablicious/releases/download/v0.3.6/tablicious-0.3.6.tar.gz   % install the pkg that formulates the table
pkg load tablicious                       % load the pkg that formulates the table
Table = {'t','capital','consumption'};
t = [1;2;3;4;5;6;7;8;9;10];
capital = capital(1:T);
consumption = consumption;
tab = table (t, capital, consumption);
prettyprint (tab)

disp(' ')
disp('Previous table including the value function')
% show results including the value function
Table = {'t','capital','consumption','vf'};
t = [1;2;3;4;5;6;7;8;9;10];
capital = capital(1:T);
consumption = consumption;
vf = vf;
tab = table (t, capital, consumption, vf);
prettyprint (tab)
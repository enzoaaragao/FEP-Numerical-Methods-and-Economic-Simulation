%%% Forecasting the PSI-20 trend based on Markov Chains

% read the psi20 closing data from 1999 to 2015
x = dlmread('../Free_Component/psi20-close.txt');    % check if the data is in the reported repository

% calculate log return of the index on a daily basis
ret = log(x(2:end))-log(x(1:end-1));    

% calculate length of all types of observations
obs_ret = length(ret);   % number of days observed
nega = sum(ret<0);       % number of days with a negative return
posi = sum(ret>0);       % number of days with a positive return
zero = sum(ret==0);      % number of days with a zero return

% show results
fprintf('The number of days observed were %g \n', obs_ret)
disp('-----------------------------')
fprintf('The number of days with negative returns were %g \n', nega)
disp('-----------------------------')
fprintf('The number of days with zero returns were %g \n', zero)
disp('-----------------------------')
fprintf('The number of days with positive returns were %g \n', posi)
disp('-----------------------------')


% calculate the state vector
p_nega = nega/obs_ret;    % probability of having a negative return on a given day
p_zero = zero/obs_ret;    % probability of having a zero return on a given day
p_posi = posi/obs_ret;    % probability of having a positive return on a given day
p=[p_nega p_zero p_posi]; % initial state vector

disp(' ')
disp(' ')
% show results
fprintf('The probability of having a negative return on a given day is %g%% \n', p_nega*100)
disp('-----------------------------')
fprintf('The probability of having a zero return on a given day is %g%% \n', p_zero*100)
disp('-----------------------------')
fprintf('The probability of having a positive return on a given day is %g%% \n', p_posi*100)
disp('-----------------------------')


% calculate the transition probability matrix - This part was only possible thanks to the assist of Professor José Abílio
conv = @(seq) seq(:,2)*3+seq(:,1)+5;
h = sign(ret);
q = conv([h(1:end-1) h(2:end)]);
C = reshape(histc(q,1:9),3,3);
M = C ./ sum(C,2);                  % first row is the about negative values; second row is about zero values; third row is about positive values...
                                      ... first column is about negative values; second coloumn is about zero values; third column is about positive values

% show some results of the transition matrix
disp(' ')
disp(' ')
fprintf('The probability of today being a negative return day and tomorrow being a positive return day is %g%% \n', M(1,3)*100)
disp('-------------------------------------------------------------------------------------------------------')
fprintf('The probability of today being a zero return day and tomorrow being a negative return day is %g%% \n', M(2,1)*100)
disp('-------------------------------------------------------------------------------------------------------')
fprintf('The probability of today being a positive return day and tomorrow being a positive return day is %g%% \n', M(3,3)*100)
disp('-------------------------------------------------------------------------------------------------------')

%% calculate the probabilties of day after the end of the observations
last_day=sum(ret(end));       % see the state of the last day
disp(' ')
disp(' ')
fprintf('The return of the last day of observations was %g%% \nSo the last day was a positive return day', last_day*100)

% Since the last day of observations was a postive return day
n0 = [0 0 1];       % n0 = the initial state of the PSI-20 (which is positive)
n1 = n0*M;          % with this we are stating that the only values of the transition matrix we want is when today's return is positive
                    % n1 = the probabilities of tomorrow's state of return of the PSI-20
disp(' ')
disp(' ')
fprintf('Since today is a positive day, the probability of tomorrow be a positive return day is %g%%', n1(3)*100)
disp('-------------------------------------------------------------------------------------------------------')
fprintf('Since today is a positive day, the probability of tomorrow be a zero return day is %g%%', n1(2)*100)
disp('-------------------------------------------------------------------------------------------------------')
fprintf('Since today is a positive day, the probability of tomorrow be a negative return day is %g%%', n1(1)*100)
disp('-------------------------------------------------------------------------------------------------------')

%% calculate the probabilities of the second day after the end of the observations
n2 = n0*M^2;          % n2 = the probabilities of day 2 (after the end of the observations) state of return of the PSI-20

disp(' ')
disp(' ')
fprintf('Since today is a positive day, the probability of 2 days from today be a positive return day is %g%%', n2(3)*100)
disp('-------------------------------------------------------------------------------------------------------')
fprintf('Since today is a positive day, the probability of 2 days from today be a zero return day is %g%%', n2(2)*100)
disp('-------------------------------------------------------------------------------------------------------')
fprintf('Since today is a positive day, the probability of 2 days from today be a negative return day is %g%%', n2(1)*100)
disp('-------------------------------------------------------------------------------------------------------')

%% calculate the probabilities of the third day after the end of the observations
n3 = n0*M^3;          % n3 = the probabilities of day 3 (after the end of the observations) state of return of the PSI-20

disp(' ')
disp(' ')
fprintf('Since today is a positive day, the probability of 3 days from today be a positive return day is %g%%', n3(3)*100)
disp('-------------------------------------------------------------------------------------------------------')
fprintf('Since today is a positive day, the probability of 3 days from today be a zero return day is %g%%', n3(2)*100)
disp('-------------------------------------------------------------------------------------------------------')
fprintf('Since today is a positive day, the probability of 3 days from today be a negative return day is %g%%', n3(1)*100)
disp('-------------------------------------------------------------------------------------------------------')

%% when will reach a stable distribution?
nday = 1;           % number of days needed
n = n0*M;

while norm(n-n0) > 0.0001
   n0 = n;
   n = n0*M;
   nday = nday + 1;
 endwhile
disp(' ')
disp(' ')
fprintf('Days:   %g\nProbability of each state:\n    Negative || Zero || Positive \n', nday), disp(n)

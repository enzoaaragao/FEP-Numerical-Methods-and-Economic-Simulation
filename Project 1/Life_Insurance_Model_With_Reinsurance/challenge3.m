% Parameters
a=0.5;          % proportion of the claim payed by the insurance company
b=5;            % life insurance claim
o=0.2;          % safety coefficient of the company
xi=0.3;         % safety coefficient of the reinsurance company

%% Fixed claim in life insurence - we are only interest in the positive root
% r must be equal or lower than 1 because it is a coefficient
f=@(r) exp(a*b*r)-((1+o)-(1+xi)*(1-a))*b*r-1
adjcoe=fzero(f, [1e-3,1]);
fprintf('In this case, the only positive root of r is %g \n', adjcoe)
disp('--------------//--------------')

%%2.a  alpha<=xi
% Parameters
b2=5; o2=0.2; xi2=0.3; a2=0.29;
f2=@(r) exp(a2*b2*r)-((1+o2)-(1+xi2)*(1-a2))*b2.*r-1
adjcoe2=fzero(f2, [1e-16,1]);
fprintf('When alpha=0.29 (ceteris paribus), r is %g \n', adjcoe2)
disp('--------------//--------------')

%%2.b alpha>=xi
% Parameters
b3=5; o3=0.2; xi3=0.3; a3=0.32;
f3=@(r) exp(a3.*b3.*r)-((1+o3)-(1+xi3).*(1-a3)).*b3.*r-1
adjcoe3=fzero(f3, [1e-16,1]);
fprintf('When alpha=0.32 (ceteris paribus), r is %g \n', adjcoe3)

%%2.b alpha>=xi
% Parameters
b6=5; o6=0.2; xi6=0.3; a6=0.34;
f6=@(r) exp(a6.*b6.*r)-((1+o6)-(1+xi6).*(1-a6)).*b6.*r-1
adjcoe6=fzero(f6, [1e-3,1]);
fprintf('When alpha=0.34 (ceteris paribus), r is %g \n', adjcoe6)

%%2.c r(alpha)
% Parameters
b4=5; o4=0.2; xi4=0.3;i=1; a4=0;
while a4<=1
  f4=@(r) exp(a4.*b4.*r)-((1+o4)-(1+xi4).*(1-a4)).*b4.*r-1;
  y(i)=fsolve(f4,1);
  x(i)=a4;
  i=i+1;
  a4=a4+0.001;
end
% Plot r(alpha)
plot(x,y,'r')
xlabel('Alpha');
ylabel('r');
title('r(alpha), for alpha<=1 (ceteris paribus)');

%% Exploring the model - how beta influences r?
% Parameters
b5=0; o5=0.2; xi5=0.3;i2=1; a5=0.5;
while b5<=5
  f5=@(r) exp(a5.*b5.*r)-((1+o5)-(1+xi5).*(1-a5)).*b5.*r-1;
  m(i)=fsolve(f5,1);
  n(i)=b5;
  i2=i2+1;
  b5=b5+1;
end
% Plot r(beta)
figure(2)
plot(n,m)
xlabel('Beta');
ylabel('r');
title('r(beta), for beta<=5 (ceteris paribus)');

%% Exploring the model - how beta influences r? (high beta)
% Parameters
b7=0; o7=0.2; xi7=0.3;i7=1; a7=0.5;
while b7<=1000
  f7=@(r) exp(a7.*b7.*r)-((1+o7)-(1+xi7).*(1-a7)).*b7.*r-1;
  m(i)=fsolve(f7,1);
  n(i)=b7;
  i7=i7+1;
  b7=b7+1;
end
% Plot r(beta)
figure(3)
plot(n,m)
xlabel('Beta');
ylabel('r');
title('r(beta), for beta<=1000 (ceteris paribus)');
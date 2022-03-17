% Read csv file from INE
fid=fopen('CPI_pt_b2012.csv');
data=textscan(fid, '%d/%d/%d %f %f %f %f %f %f %f %f %f', 'delimiter', ',', 'headerlines', 1);
fclose(fid);

% Descriptive statistics
pkg load statistics
pkg load nan
disp('Descriptive Statistics')
disp('----------------------')

disp('CPI Total')
mt=mean(data{4});
mdt=median(data{4});
modet=mode(data{4});
ranget=range(data{4});
skt=skewness(data{4},0);
ktt=kurtosis(data{4},0);
fprintf('mean: %g \n', mt);
fprintf('median: %g \n', mdt);
fprintf('mode: %g \n', modet);
fprintf('range: %g \n', ranget);
fprintf('skewness: %g \n', skt);
fprintf('kurtosis: %g \n', ktt);
disp('----------//----------')

disp('CPI Goods')
mg=nanmean(data{5});          
mdg=nanmedian(data{5});       
modeg=mode(data{5});
rangeg=range(data{5});
skg=skewness(data{5},0);
ktg=kurtosis(data{5},0);
fprintf('mean: %g \n', mg);
fprintf('median: %g \n', mdg);
fprintf('mode: %g \n', modeg);
fprintf('range: %g \n', rangeg);
fprintf('skewness: %g \n', skg);
fprintf('kurtosis: %g \n', ktg);

disp('----------//----------')

disp('CPI Services')
ms=nanmean(data{6});
mds=nanmedian(data{6});
modes=mode(data{6});
ranges=range(data{6});
sks=skewness(data{6},0);
kts=kurtosis(data{6},0);
fprintf('mean: %g \n', ms);
fprintf('median: %g \n', mds);
fprintf('mode: %g \n', modes);
fprintf('range: %g \n', ranges);
fprintf('skewness: %g \n', sks);
fprintf('kurtosis: %g \n', kts);

disp('----------//----------')

disp('CPI Total Excluding Housing')
mteh=mean(data{7});
mdteh=median(data{7});
modeteh=mode(data{7});
rangeteh=range(data{7});
skteh=skewness(data{7},0);
ktteh=kurtosis(data{7},0);
fprintf('mean: %g \n', mteh);
fprintf('median: %g \n', mdteh);
fprintf('mode: %g \n', modeteh);
fprintf('range: %g \n', rangeteh);
fprintf('skewness: %g \n', skteh);
fprintf('kurtosis: %g \n', ktteh);
disp('----------//----------')

disp('CPI Total Excluding Unprocessed Food and Energy')
mteufe=mean(data{8});
mdteufe=median(data{8});
modeteufe=mode(data{8});
rangeteufe=range(data{8});
skteufe=skewness(data{8},0);
ktteufe=kurtosis(data{8},0);
fprintf('mean: %g \n', mteufe);
fprintf('median: %g \n', mdteufe);
fprintf('mode: %g \n', modeteufe);
fprintf('range: %g \n', rangeteufe);
fprintf('skewness: %g \n', skteufe);
fprintf('kurtosis: %g \n', ktteufe);
disp('----------//----------')

disp('CPI Total Excluding Unprocessed Food')
mteuf=mean(data{9});
mdteuf=median(data{9});
modeteuf=mode(data{9});
rangeteuf=range(data{9});
skteuf=skewness(data{9},0);
ktteuf=kurtosis(data{9},0);
fprintf('mean: %g \n', mteuf);
fprintf('median: %g \n', mdteuf);
fprintf('mode: %g \n', modeteuf);
fprintf('range: %g \n', rangeteuf);
fprintf('skewness: %g \n', skteuf);
fprintf('kurtosis: %g \n', ktteuf);
disp('----------//----------')

disp('CPI Total Excluding Energy')
mtee=mean(data{10});
mdtee=median(data{10});
modetee=mode(data{10});
rangetee=range(data{10});
sktee=skewness(data{10},0);
kttee=kurtosis(data{10},0);
fprintf('mean: %g \n', mtee);
fprintf('median: %g \n', mdtee);
fprintf('mode: %g \n', modetee);
fprintf('range: %g \n', rangetee);
fprintf('skewness: %g \n', sktee);
fprintf('kurtosis: %g \n', kttee);
disp('----------//----------')

disp('CPI Unprocessed Food')
muf=mean(data{11});
mduf=median(data{11});
modeuf=mode(data{11});
rangeuf=range(data{11});
skuf=skewness(data{11},0);
ktuf=kurtosis(data{11},0);
fprintf('mean: %g \n', muf);
fprintf('median: %g \n', mduf);
fprintf('mode: %g \n', modeuf);
fprintf('range: %g \n', rangeuf);
fprintf('skewness: %g \n', skuf);
fprintf('kurtosis: %g \n', ktuf);
disp('----------//----------')

disp('CPI Energy')
me=mean(data{12});
mde=median(data{12});
modee=mode(data{12});
rangee=range(data{12});
ske=skewness(data{12},0);
kte=kurtosis(data{12},0);
fprintf('mean: %g \n', me);
fprintf('median: %g \n', mde);
fprintf('mode: %g \n', modeteuf);
fprintf('range: %g \n', rangee);
fprintf('skewness: %g \n', ske);
fprintf('kurtosis: %g \n', kte);
disp('----------//----------')

figure(1)
subplot(3,3,1), hist(data{4})
title('CPI Total histogram')
subplot(3,3,2), hist(data{5})
title('CPI Goods histogram')
subplot(3,3,3), hist(data{6})
title('CPI Services histogram')
subplot(3,3,4), hist(data{7})
title('CPI TEH histogram')
subplot(3,3,5), hist(data{8})
title('CPI TEUFE histogram')
subplot(3,3,6), hist(data{9})
title('CPI TEUF histogram')
subplot(3,3,7), hist(data{10})
title('CPI TEE histogram')
subplot(3,3,8), hist(data{11})
title('CPI Unprocessed Food histogram')
subplot(3,3,9), hist(data{12})
title('CPI Energy histogram')

% Plot the CPI categories' values between 1948 and 2021
dates=datenum(double(data{3}),double(data{1}),double(data{2}));
figure(2)
plot(dates,data{4},'k')
datetick('x', 'yyyy');
xlabel('Year');
ylabel('CPI');
title('CPI evolution in Portugal');
xlim([min(dates), max(dates)]);
hold on
plot(dates,data{5},'c');
plot(dates,data{6},'b');
plot(dates,data{7},'r');
plot(dates,data{8},'g');
plot(dates,data{9},'m');
plot(dates,data{10});
plot(dates,data{11});
plot(dates,data{12});
legend({'Total', 'Goods', 'Services', 'Total excluding housing', 'Total excluding unprocessed food and energy', 'Total excluding unprocessed food', 'Total excluding energy', 'Unprocessed food', 'Energy'}, 'location', 'northwest');
legend('boxoff');
hold off

% Plot the CPI categories' values pre and during COVID-19
fidc=fopen('CPI_pt_2019_2021.csv');
datac=textscan(fidc, '%d/%d/%d %f %f %f %f %f %f %f %f %f', 'delimiter', ',', 'headerlines', 1);
fclose(fidc);
datesc=datenum(double(datac{3}),double(datac{1}),double(datac{2}));

figure(3)
plot(datesc,datac{4},'k')
datetick('x', 'mmm-yyyy');
xlabel('Year');
ylabel('CPI');
title('CPI evolution in Portugal between 2019 and 2021');
xlim([min(datesc), max(datesc)]);
hold on
plot(datesc,datac{5},'c');
plot(datesc,datac{6},'b');
plot(datesc,datac{7},'r');
plot(datesc,datac{8},'g');
plot(datesc,datac{9},'m');
plot(datesc,datac{10});
plot(datesc,datac{11});
plot(datesc,datac{12});
legend({'Total', 'Goods', 'Services', 'Total excluding housing', 'Total excluding unprocessed food and energy', 'Total excluding unprocessed food', 'Total excluding energy', 'Unprocessed food', 'Energy'}, 'location', 'southwest');
legend('boxoff');
hold off

% Read csv file from FRED about the CPI evolution in Spain
fids=fopen('CPI_spain_b2012.csv');
dataspain=textscan(fids, '%d/%d/%d %f %f', 'delimiter', ',', 'headerlines', 1);
fclose(fids);

% Plot the total CPI in Portugal and Spain after both countries were in the European Union, 1986-2021
datespain=datenum(double(dataspain{3}),double(dataspain{1}),double(dataspain{2}));
figure(4)
plot(dates,data{4})
datetick('x', 'yyyy');
ylabel('CPI');
xlabel('Year');
xlim([min(datespain),max(datespain)]);
title('Total CPI evolution in Portugal and Spain after the entry in the EU (1986-2021)');
hold on
plot(datespain,dataspain{5},'m')
legend('Portugal','Spain','location','southwest');
hold off
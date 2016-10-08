load sunspot.dat
year = sunspot(:,1);
relNums = sunspot(:,2);
findpeaks(relNums,year)
xlabel('Year')
ylabel('Sunspot Number')
title('Find All Peaks')

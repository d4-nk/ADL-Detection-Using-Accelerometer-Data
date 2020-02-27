function[fec]=time_fec(data)

fec = [];
for i = 1:12
    me=mean(data(:,i)');
    var1=var(data(:,i)');
    ske=skewness(data(:,i)');
    kur=kurtosis(data(:,i)');
    max1 = max(data(:,i)');
    min1 = min(data(:,i)');
    fe=[me var1 ske kur max1 min1];
    fec = [fec fe];
end
end


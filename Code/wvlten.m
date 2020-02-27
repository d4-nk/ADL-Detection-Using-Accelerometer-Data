function [enerji] = wvlten(data)

enerji = [];

for i = 1:1:12
    datax = data(:,i)';
    [c,l] = wavedec(datax,7,'haar');
    approx = appcoef(c,l,'haar');
    [cd1,cd2,cd3,cd4,cd5,cd6,cd7] = detcoef(c,l,[1 2 3 4 5 6 7]);
    Ea = sum(approx.^2);
    e1 = sum(cd1.^2);
    e2 = sum(cd1.^2);
    e3 = sum(cd1.^2);
    e4 = sum(cd1.^2);
    e5 = sum(cd1.^2);
    e6 = sum(cd1.^2);
    e7 = sum(cd1.^2);
    enerji = [enerji Ea e1 e2 e3 e4 e5 e6 e7];
end

end
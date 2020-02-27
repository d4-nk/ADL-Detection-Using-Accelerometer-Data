function minmax = min_max(data)

minmax = [];

for i = 1:1:12
    s=0;
    dataz = data(:,i);
    for j = 1:5:length(data)
        datax = dataz(j:min(j+4,length(dataz)-1))';
        max1 = max(datax);
        min1 = min(datax);
        s = s + (max1 - min1);
    end
    minmax = [minmax s];
end

end
function vel = velocity(data)

vel = [];

for i = 1:1:12
    s=0;
    count = 0;
    dataz = data(:,i);
    for j = 1:10:length(data)
        count= count + 1;
        datax = dataz(j:min(j+9,length(dataz)-1))';
        s = s + trapz(datax);
    end
    s = s/count;
    vel = [vel s];
end

end
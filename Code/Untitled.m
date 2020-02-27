clc
clear

data = [];
feat = [];
files = dir(fullfile("*.csv"));

for k = 1:1:5
    data = importdata(files(k).name);
    data = data(:,2:5);
    data(:,5) = data(:,4);
    data(:,4) = sqrt(data(:,1).*data(:,1) + data(:,2).*data(:,2) + data(:,3).*data(:,3));

    index = data(:,5) == 6;
    data(index,5) = 4;
    index = data(:,5) ~= 2;
    data = data(index,:);

    for i = 1:1:7
        ind = data(:,5) == i;
        datax = data(ind,1:4);
        for j = 1:26:length(datax)
            z = [k i j];
            disp(z);
            datay = datax(j:min((j+52),length(datax)),:);
            f1 = time_fec(datay);
            f3 = ics_fec(datay);
            ff = [f1 f3 i];
            feat = [feat' ff'];
            feat = feat';
        end
    end
end
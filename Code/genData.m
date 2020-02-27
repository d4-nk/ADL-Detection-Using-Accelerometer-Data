clc
clear

data = [];
feat = [];

files = dir(fullfile("*.csv"));

for k = 1:1:1
    data = importdata(files(k).name);
    data = data(:,2:5);
    data(:,13) = data(:,4);
    data(:,4) = sqrt(data(:,1).*data(:,1) + data(:,2).*data(:,2) + data(:,3).*data(:,3));

    index = data(:,13) ~= 6;
    data = data(index,:);
    index = data(:,13) ~= 2;
    data = data(index,:);

    for o = 1:1:4
        inputsignal = data(:,o);
        order = 10;
        Fs = 52;
        cutoff_freq = 1;
        nyquist_freq = Fs/2;
        Wn = cutoff_freq/nyquist_freq;
        [filtb,filta] = butter(order,Wn,'high');
        y = filtfilt(filtb,filta,inputsignal);
        [filtb1,filta1] = butter(order,Wn,'low');
        y1 = filtfilt(filtb1,filta1,inputsignal); 
        data(:,o+4) = y1;
        data(:,o+8) = y;
    end
    for i = 1:1:7
        feat1 = [];
        ind = data(:,13) == i;
        datax = data(ind,1:12);
        
        for j = 1:26:length(datax)
            z = [k i j];
            disp(z);
            datay = datax(j:min((j+51),length(datax)),:);
            f1 = time_fec(datay);
            f3 = ics_fec(datay);
            %f2 = wvlten(datay);
            %f4 = min_max(datay);
            f5 = velocity(datay);
            ff = [f1 f3 f5 i];
            feat = [feat' ff'];
            feat = feat';
        end
    end
end

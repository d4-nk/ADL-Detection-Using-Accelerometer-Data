file = importdata("3.csv");
file = file(:,2:5);
file(:,13) = file(:,4);
file(:,4) = sqrt(file(:,1).*file(:,1) + file(:,2).*file(:,2) + file(:,3).*file(:,3));

index = file(:,13) ~= 6;
file = file(index,:);
index = file(:,13) ~= 2;
file = file(index,:);

tfeat = [];

for o = 1:1:4
    inputsignal = file(:,o);
    order = 10;
    Fs = 52;
    cutoff_freq = 1;
    nyquist_freq = Fs/2;
    Wn = cutoff_freq/nyquist_freq;
    [filtb,filta] = butter(order,Wn,'high');
    y = filtfilt(filtb,filta,inputsignal);
    [filtb1,filta1] = butter(order,Wn,'low');
    y1 = filtfilt(filtb1,filta1,inputsignal); 
    file(:,o+4) = y1;
    file(:,o+8) = y;
end
for i = 1:1:7
    ind = file(:,13) == i;
    filex = file(ind,1:12);
    for j = 1:26:length(filex)
        z = [k i j];
        disp(z);
        filey = filex(j:min((j+51),length(filex)),:);
        tf1 = time_fec(filey);
        tf3 = ics_fec(filey);
        tf2 = wvlten(filey);
        %f4 = min_max(filey);
        tff = [tf1 tf3 tf2 i];
        tfeat = [tfeat' tff'];
        tfeat = tfeat';
    end
end


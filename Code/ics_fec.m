function cross_corr=ics_fec(data)
y=[];
for i=1:1:2
    for j=i+1:1:3
        if(i~=j)
            x=max(xcorr(data(:,i),data(:,j)));
            y=[y x];
        end
    end
end
for i=5:1:6
    for j=i+1:1:7
        if(i~=j)
            x=max(xcorr(data(:,i),data(:,j)));
            y=[y x];
        end
    end
end
for i=9:1:10
    for j=i+1:1:11
        if(i~=j)
            x=max(xcorr(data(:,i),data(:,j)));
            y=[y x];
        end
    end
end
cross_corr=y;
            
end
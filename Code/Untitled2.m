feat2 = [];
for i = 1:1:7
    index = feat(:,94) == i;
    de = feat(index,:);
    a = size(de);
    de = de(1:min(200,a(1)),:);
    feat2 = [feat2' de']';
end
    
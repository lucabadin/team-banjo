function[] = testTask1()
% Verify conditional independence & uniformity of your outputs by running
% many times (>=10^4) with the same input, and gathering statistics
% for simplicity, x = zeros (false is more efficient)
x = false(1,7);

% we shall store stats in two maps
% can't put logical as key type...
% convert and store as int32 unless there's a better way?
ystats = zeros(65,1);
zstats = zeros(113,1);

% ystats = containers.Map('KeyType','int32','ValueType','int32');
% zstats = containers.Map('KeyType','int32','ValueType','int32');

for i = 1:10000
    [y,z] = wiretap(x);
    y = convertBString(y) + 1;
    ystats(y,1) = ystats(y,1) + 1;
    z = convertBString(z) + 1;
    zstats(z,1) = zstats(z,1) + 1;
end
end
delta_t = 0.01;

load('Long_test_5Hz_1_28bytes.mat')
time = data{4}.Values.Time;
pinst_1bytes = double(reshape(data{4}.Values.Data,[],1));

% load('Long_test_5Hz_2_48bytes.mat')
% time = data{5}.Values.Time;
% pinst_1bytes = double(reshape(data{5}.Values.Data,[],1));

e_c_1bytes = 0;

for i=1:4
for i=1:length(time)
    e_c_1bytes = e_c_1bytes + pinst_1bytes(i) * (delta_t / 3600.0);
end
end

e_c_1bytes

VDD = 5;
e_c_1bytes/VDD
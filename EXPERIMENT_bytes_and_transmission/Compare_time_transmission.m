% Experiment time
delta_t = 0.01;
% Power supply 5V

load('Experiment_1Hz_48bytes.mat')
time = data{end}.Values.Time;
pinst_48bytes = double(reshape(data{end}.Values.Data,[],1));
load('Experiment_1Hz_32bytes.mat')
pinst_32bytes = double(reshape(data{end}.Values.Data,[],1));
load('Experiment_1Hz_24bytes.mat')
pinst_24bytes = double(reshape(data{end}.Values.Data,[],1));
load('Experiment_1Hz_16bytes.mat')
pinst_16bytes = double(reshape(data{end}.Values.Data,[],1));
load('Experiment_1Hz_8bytes.mat')
pinst_8bytes = double(reshape(data{end}.Values.Data,[],1));
load('Experiment_1Hz_4bytes.mat')
pinst_4bytes = double(reshape(data{end}.Values.Data,[],1));
load('Experiment_1Hz_2bytes.mat')
pinst_2bytes = double(reshape(data{end}.Values.Data,[],1));
load('Experiment_1Hz_1bytes.mat')
pinst_1bytes = double(reshape(data{end}.Values.Data,[],1));

figure; hold on;
plot(time, pinst_1bytes(1:length(time)));
plot(time, pinst_2bytes(1:length(time)));
plot(time, pinst_4bytes(1:length(time)));
plot(time, pinst_8bytes(1:length(time)));

xlabel("time (s)");
ylabel("instantaneous power (mW)");
legend("1 bytes", "2 bytes", "4 bytes", "8 bytes");

figure; hold on;
plot(time, pinst_16bytes(1:length(time)));
plot(time, pinst_24bytes(1:length(time)));
plot(time, pinst_32bytes(1:length(time)));
plot(time, pinst_48bytes(1:length(time)));


xlabel("time (s)");
ylabel("instantaneous power (mW)");
legend("16 bytes", "24 bytes", "32 bytes", "48 bytes");

%% 

e_c_1bytes = 0;
e_c_2bytes = 0;
e_c_4bytes = 0;
e_c_8bytes = 0;
e_c_16bytes = 0;
e_c_24bytes = 0;
e_c_32bytes = 0;
e_c_48bytes = 0;

for i=1:60 % Expected in one hour
for i=1:length(time)
    e_c_1bytes = e_c_1bytes + pinst_1bytes(i) * (delta_t / 3600.0);
    e_c_2bytes = e_c_2bytes + pinst_2bytes(i) * (delta_t / 3600.0);
    e_c_4bytes = e_c_4bytes + pinst_4bytes(i) * (delta_t / 3600.0);
    e_c_8bytes = e_c_8bytes + pinst_8bytes(i) * (delta_t / 3600.0);
    e_c_16bytes = e_c_16bytes + pinst_16bytes(i) * (delta_t / 3600.0);
    e_c_24bytes = e_c_24bytes + pinst_24bytes(i) * (delta_t / 3600.0);
    e_c_32bytes = e_c_32bytes + pinst_32bytes(i) * (delta_t / 3600.0);
    e_c_48bytes = e_c_48bytes + pinst_48bytes(i) * (delta_t / 3600.0);
end
end

figure; hold on;
plot(1, e_c_1bytes, '*')
plot(2, e_c_2bytes, '*')
plot(4, e_c_4bytes, '*')
plot(8, e_c_8bytes, '*')
plot(16, e_c_16bytes, '*')
plot(24, e_c_24bytes, '*')
plot(32, e_c_32bytes, '*')
plot(48, e_c_48bytes, '*')
plot([1 2 4 8 16 24 32 48], [e_c_1bytes e_c_2bytes e_c_4bytes e_c_8bytes e_c_16bytes e_c_24bytes e_c_32bytes e_c_48bytes])


xlabel("packet size (bytes) - 1Hz");
ylabel("Expected energy consumption (mW)");
legend("1 bytes", "2 bytes", "4 bytes", "8 bytes", "16 bytes", "24 bytes", "32 bytes", "48 bytes", "Line", 'Location', 'northwest');

% VDD = 5;
% figure; hold on;
% plot(1, e_c_1bytes/VDD, '*')
% plot(2, e_c_2bytes/VDD, '*')
% plot(4, e_c_4bytes/VDD, '*')
% plot(8, e_c_8bytes/VDD, '*')
% plot(16, e_c_16bytes/VDD, '*')
% plot(24, e_c_24bytes/VDD, '*')
% plot(32, e_c_32bytes/VDD, '*')
% plot(48, e_c_48bytes/VDD, '*')
% plot([1 2 4 8 16 24 32 48], [e_c_1bytes e_c_2bytes e_c_4bytes e_c_8bytes e_c_16bytes e_c_24bytes e_c_32bytes e_c_48bytes]/VDD)
% 
% 
% xlabel("packet size (bytes) - 1Hz");
% ylabel("Expected energy consumption (mAh)");
% legend("1 bytes", "2 bytes", "4 bytes", "8 bytes", "16 bytes", "24 bytes", "32 bytes", "48 bytes", "Line", 'Location', 'northwest');
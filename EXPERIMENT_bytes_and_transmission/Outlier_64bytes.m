%% 

load('Experiment_1Hz_64bytes.mat')
time = data{end}.Values.Time;
pinst_64bytes = double(reshape(data{end}.Values.Data,[],1));

figure; hold on;
plot(time, pinst_64bytes(1:length(time)));

xlabel("time (s)");
ylabel("instantaneous power (mW)");
legend("64 bytes");
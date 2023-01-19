load('power_consumption_21dBm_56_bytes.mat')
time = data.Time;
pinst_21dBm = double(reshape(data.Data,[],1));
load('power_consumption_24dBm_56_bytes.mat')
pinst_24dBm = double(reshape(data.Data,[],1));
load('power_consumption_27dBm_56_bytes.mat')
pinst_27dBm = double(reshape(data.Data,[],1));
load('power_consumption_30dBm_56_bytes.mat')
pinst_30dBm = double(reshape(data.Data,[],1));

figure; hold on;
plot(time, pinst_21dBm);
plot(time, pinst_24dBm);
plot(time, pinst_27dBm);
plot(time, pinst_30dBm);

xlabel("time (s)");
ylabel("instantaneous power (mW)");
legend("21 dBm", "24 dBm", "27 dBm", "30 dBm");
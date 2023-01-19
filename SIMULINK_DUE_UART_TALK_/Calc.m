% https://electronics.stackexchange.com/questions/237025/converting-watt-values-over-time-to-kwh

load('test_power_consumption.mat')

T = 0.01; % Sampling period in seconds
time = power_consumption.Time;
pinst_mW = double(reshape(power_consumption.Data,[],1)); % Medidas en watts

% p_mWh = pinst_mW * (T/3600);

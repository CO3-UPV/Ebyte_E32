close all;
clear

load('Experiment_1Hz_48bytes.mat') % Special case to analysis, uart problems behaviour
N = length(data{2}.Values.Time);

id_send_48bytes = data{2}.Values.Data;
id_send_time_48bytes = data{2}.Values.Time;
id_recv_48bytes = data{3}.Values.Data;
id_recv_time_48bytes = data{3}.Values.Time;

load('Experiment_1Hz_32bytes.mat')
id_send_32bytes = data{2}.Values.Data;
id_send_time_32bytes = data{2}.Values.Time;
id_recv_32bytes = data{3}.Values.Data;
id_recv_time_32bytes = data{3}.Values.Time;

load('Experiment_1Hz_24bytes.mat')
id_send_24bytes = data{2}.Values.Data;
id_send_time_24bytes = data{2}.Values.Time;
id_recv_24bytes = data{3}.Values.Data;
id_recv_time_24bytes = data{3}.Values.Time;

load('Experiment_1Hz_16bytes.mat')
id_send_16bytes = data{2}.Values.Data;
id_send_time_16bytes = data{2}.Values.Time;
id_recv_16bytes = data{3}.Values.Data;
id_recv_time_16bytes = data{3}.Values.Time;

load('Experiment_1Hz_8bytes.mat')
id_send_8bytes = data{2}.Values.Data;
id_send_time_8bytes = data{2}.Values.Time;
id_recv_8bytes = data{3}.Values.Data;
id_recv_time_8bytes = data{3}.Values.Time;

load('Experiment_1Hz_4bytes.mat')
id_send_4bytes = data{2}.Values.Data;
id_send_time_4bytes = data{2}.Values.Time;
id_recv_4bytes = data{3}.Values.Data;
id_recv_time_4bytes = data{3}.Values.Time;

load('Experiment_1Hz_2bytes.mat')
id_send_2bytes = data{2}.Values.Data;
id_send_time_2bytes = data{2}.Values.Time;
id_recv_2bytes = data{3}.Values.Data;
id_recv_time_2bytes = data{3}.Values.Time;

load('Experiment_1Hz_1bytes.mat')
id_send_1bytes = data{2}.Values.Data;
id_send_time_1bytes = data{2}.Values.Time;
id_recv_1bytes = data{3}.Values.Data;
id_recv_time_1bytes = data{3}.Values.Time;

RTT_48bytes = zeros(length(N)-1, 1);
RTT_32bytes = zeros(length(N)-1, 1);
RTT_24bytes = zeros(length(N)-1, 1);
RTT_16bytes = zeros(length(N)-1, 1);
RTT_8bytes = zeros(length(N)-1, 1);
RTT_4bytes = zeros(length(N)-1, 1);
RTT_2bytes = zeros(length(N)-1, 1);
RTT_1bytes = zeros(length(N)-1, 1);

for id=1:N-1 % id_send_1bytes
    idx = find(id_recv_1bytes == id, 1, 'first');
    if ~isempty(idx)
        RTT_1bytes(id) = id_recv_time_1bytes(idx) - id_send_time_1bytes(id);
    end
end

for id=1:N-1 % id_send_2bytes
    idx = find(id_recv_2bytes == id, 1, 'first');
    if ~isempty(idx)
        RTT_2bytes(id) = id_recv_time_2bytes(idx) - id_send_time_2bytes(id);
    end
end

for id=1:N-1 % id_send_4bytes
    idx = find(id_recv_4bytes == id, 1, 'first');
    if ~isempty(idx)
        RTT_4bytes(id) = id_recv_time_4bytes(idx) - id_send_time_4bytes(id);
    end
end

for id=1:N-1 % id_send_8bytes
    idx = find(id_recv_8bytes == id, 1, 'first');
    if ~isempty(idx)
        RTT_8bytes(id) = id_recv_time_8bytes(idx) - id_send_time_8bytes(id);
    end
end

for id=1:N-1 % id_send_16bytes
    idx = find(id_recv_16bytes == id, 1, 'first');
    if ~isempty(idx)
        RTT_16bytes(id) = id_recv_time_16bytes(idx) - id_send_time_16bytes(id);
    end
end

for id=1:N-1 % id_send_24bytes
    idx = find(id_recv_24bytes == id, 1, 'first');
    if ~isempty(idx)
        RTT_24bytes(id) = id_recv_time_24bytes(idx) - id_send_time_24bytes(id);
    end
end

for id=1:N-1 % id_send_32bytes
    idx = find(id_recv_32bytes == id, 1, 'first');
    if ~isempty(idx)
        RTT_32bytes(id) = id_recv_time_32bytes(idx) - id_send_time_32bytes(id);
    end
end

for id=1:N-1 % id_send_48bytes
    idx = find(id_recv_48bytes == id, 1, 'first');
    if ~isempty(idx)
        RTT_48bytes(id) = id_recv_time_48bytes(idx) - id_send_time_48bytes(id);
    end
end

DP_1bytes = sum(RTT_1bytes==0)/(N-1) % Dropout prob
RTT_1bytes(RTT_1bytes==0) = [];
figure; histogram(RTT_1bytes);
title("Round Time Trip (1 bytes) + Dropout prob. = " + num2str(DP_1bytes));
xlabel("RTT (seg)")
ylabel("N. Packets")

DP_2bytes = sum(RTT_2bytes==0)/(N-1) % Dropout prob
RTT_2bytes(RTT_2bytes==0) = [];
figure; histogram(RTT_2bytes);
title("Round Time Trip (2 bytes) + Dropout prob. = " + num2str(DP_2bytes));
xlabel("RTT (seg)")
ylabel("N. Packets")

DP_4bytes = sum(RTT_4bytes==0)/(N-1) % Dropout prob
RTT_4bytes(RTT_4bytes==0) = [];
figure; histogram(RTT_4bytes);
title("Round Time Trip (4 bytes) + Dropout prob. = " + num2str(DP_4bytes));
xlabel("RTT (seg)")
ylabel("N. Packets")

DP_8bytes = sum(RTT_8bytes==0)/(N-1) % Dropout prob
RTT_8bytes(RTT_8bytes==0) = [];
figure; histogram(RTT_8bytes);
title("Round Time Trip (8 bytes) + Dropout prob. = " + num2str(DP_8bytes));
xlabel("RTT (seg)")
ylabel("N. Packets")

DP_16bytes = sum(RTT_16bytes==0)/(N-1) % Dropout prob
RTT_16bytes(RTT_16bytes==0) = [];
figure; histogram(RTT_16bytes);
title("Round Time Trip (16 bytes) + Dropout prob. = " + num2str(DP_16bytes));
xlabel("RTT (seg)")
ylabel("N. Packets")

DP_24bytes = sum(RTT_24bytes==0)/(N-1) % Dropout prob
RTT_24bytes(RTT_24bytes==0) = [];
figure; histogram(RTT_24bytes);
title("Round Time Trip (24 bytes) + Dropout prob. = " + num2str(DP_24bytes));
xlabel("RTT (seg)")
ylabel("N. Packets")

DP_32bytes = sum(RTT_32bytes==0)/(N-1) % Dropout prob
RTT_32bytes(RTT_32bytes==0) = [];
figure; histogram(RTT_32bytes);
title("Round Time Trip (32 bytes) + Dropout prob. = " + num2str(DP_32bytes));
xlabel("RTT (seg)")
ylabel("N. Packets")

DP_48bytes = sum(RTT_48bytes==0)/(N-1) % Dropout prob
RTT_48bytes(RTT_48bytes==0) = [];
figure; histogram(RTT_48bytes);
title("Round Time Trip (48 bytes) + Dropout prob. = " + num2str(DP_48bytes));
xlabel("RTT (seg)")
ylabel("N. Packets")
id_send = data{2}.Values.Data;
id_send_time = data{2}.Values.Time;

id_recv = data{3}.Values.Data;
id_recv_time = data{3}.Values.Time;

RTT = zeros(length(id_send)-1, 1);
for id=1:length(id_send)-1
    idx = find(data{3}.Values.Data==id, 1, 'first');
    if ~isempty(idx)
        RTT(id) = id_recv_time(idx) - id_send_time(id);
    end
end


CE = sum(RTT>0)
EP = sum(RTT>0)/(length(id_send)-1)
CD = sum(RTT==0)
DP = sum(RTT==0)/(length(id_send)-1)

RTT(RTT==0) = [];
histogram(RTT);

title("Round Time Trip (5Hz - 48 bytes) + Dropout prob. = " + num2str(DP));
xlabel("RTT (seg)")
ylabel("N. Packets")
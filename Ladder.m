clc;
clear variables;

open('LADDER.slx');

%Задать изначальное напряжение
set_param('LADDER/Voltage Source1', 'dc_voltage', '4');

%Задать биты, поданные на вход
set_param('LADDER/PS Constant', 'constant', '1')
set_param('LADDER/PS Constant1', 'constant', '0')
set_param('LADDER/PS Constant2', 'constant', '0')
set_param('LADDER/PS Constant3', 'constant', '0')

c1 = get_param('LADDER/PS Constant', 'constant');
c2 = get_param('LADDER/PS Constant1', 'constant');
c3 = get_param('LADDER/PS Constant2', 'constant');
c4 = get_param('LADDER/PS Constant3', 'constant');

C = [c1 c2 c3 c4];
H = 'Сигнал, поданный на вход:';
disp(H);
disp(C);

%vin = get_param('LADDER/Voltage Source', 'dc_voltage');
%get_param('LADDER/To Workspace', 'ObjectParameters')

sim('LADDER.slx');

M_out = max(vout);
M_in = max(vin);

H1 = 'Амплитуда входного напряжения:';
H2 = 'Амплитуда выходного напряжения:';

disp(H1);
disp(M_in);
disp(H2);
disp(M_out);

L = length(vin);
t = linspace(1, 5, L);

figure(1)
clf;
ax = gca;

plot(t, vin, 'g.-', 'LineWidth', 2);
hold on;
plot(t, vout, 'r', 'LineWidth', 2);
hold off;
legend({'V IN', 'V OUT'});
xlim([1 5]);
%ylim([0 8]);
grid on;
grid minor;
xlabel('t, c', 'FontSize', 18);
ylabel('V, Вольт', 'FontSize', 18);
title('ЦАП лестничного типа', 'FontSize', 18);

%vin = vin(1)
%vout = vout(1)
%y = [vin; vout];

%c = categorical({'1 - V_IN', '2 - V_OUT'});
%b = bar(c, y, 'EdgeColor', [0 0.9 0.9], 'LineWidth', 1.5);
%b.FaceColor = 'flat';
%b.CData(1, :) = [1 0.8 0.6];
%b.CData(2, :) = [0.6 1 0.6];

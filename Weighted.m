clc;
clear all;

open('WEIGHTED.slx');

%Задать изначальное напряжение
set_param('WEIGHTED/Voltage Source', 'dc_voltage', '4');

%Задать биты, поданные на вход
set_param('WEIGHTED/PS Constant', 'constant', '1')
set_param('WEIGHTED/PS Constant1', 'constant', '1')
set_param('WEIGHTED/PS Constant2', 'constant', '1')
set_param('WEIGHTED/PS Constant3', 'constant', '1')

c1 = get_param('WEIGHTED/PS Constant', 'constant');
c2 = get_param('WEIGHTED/PS Constant1', 'constant');
c3 = get_param('WEIGHTED/PS Constant2', 'constant');
c4 = get_param('WEIGHTED/PS Constant3', 'constant');

C = [c1 c2 c3 c4];
H = 'Сигнал, поданный на вход:';
disp(H);
disp(C);

%vin = get_param('LADDER/Voltage Source', 'dc_voltage');
%get_param('LADDER/To Workspace', 'ObjectParameters')

sim('WEIGHTED.slx');

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

plot(t, vin, 'g.-', 'LineWidth', 2);
hold on;
plot(t, vout, 'r', 'LineWidth', 2);
hold off;
legend({'V IN', 'V OUT'});
xlim([1 5]);
%ylim([0 15]);
grid on;
grid minor;
xlabel('t, c', 'FontSize', 18);
ylabel('V, Вольт', 'FontSize', 18);
title('ЦАП взвешенного типа', 'FontSize', 18);


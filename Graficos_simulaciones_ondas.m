clear 
close all

Ts=1e-6;
t=0.1:Ts:2;

Load_sim_data;
%% fft's
N=size(t,2);
fft_seno=fft(seno);
fft_seno=fft_seno(1:floor(size(t,2)/2));

fft_cuad=fft(cuad);
fft_cuad=fft_cuad(1:floor(size(t,2)/2));

fft_triang=fft(triang);
fft_triang=fft_triang(1:floor(size(t,2)/2));


L=size(fft_seno,2);
fft_freq=(0:L-1)/(Ts*L*2);

[f0,position,Amp]=FindFundamentalFreq(fft_freq,fft_seno);
cant_osc_graf=5;


%% seno

figure
subplot(2,1,1)
plot((t-0.1)*1e3,seno,'-b','LineWidth',1);
axis([0 1e3*cant_osc_graf/f0 -5 5])
xlabel('tiempo (ms)');
ylabel('Amplitud (V)');
grid on
legend('Simulacion Proteus');   
title("Simulacion seno por ruptura");

subplot(2,1,2)
dist_seno=SignalDistortion(abs(fft_seno),fft_freq,'S',30,false);
ylim=max(abs(fft_seno))*1.2;
axis([0 f0*30 0 ylim ])
xlabel('Frecuencia (Hz)');
title(strcat('FFT Senoidal Simualda  ','    F_D=',string(dist_seno*100),'%'));
grid minor;





%% cuadrada

figure
subplot(2,1,1)
plot((t-0.1)*1e3,cuad,'-b','LineWidth',1);
axis([0 1e3*cant_osc_graf/f0 -20 20])
xlabel('tiempo (ms)');
ylabel('Amplitud (V)');
grid on
legend('Simulacion Proteus');   
title("Simulacion cuadrada ");

subplot(2,1,2)
dist_cuad=SignalDistortion(abs(fft_cuad),fft_freq,'C',15,false);
ylim=max(abs(fft_cuad))*1.2;
axis([0 f0*30 0 ylim ])
xlabel('Frecuencia (Hz)');
title(strcat('FFT cuadrada Simualda  ','    F_D=',string(dist_cuad*100),'%'));
grid minor;

%% triangular

figure
subplot(2,1,1)
plot((t-0.1)*1e3,triang,'-b','LineWidth',1);
axis([0 1e3*cant_osc_graf/f0 -10 10])
xlabel('tiempo (ms)');
ylabel('Amplitud (V)');
grid on
legend('Simulacion Proteus');   
title("Simulacion triangular ");

subplot(2,1,2)
dist_triang=SignalDistortion(abs(fft_triang),fft_freq,'T',15,false);
ylim=max(abs(fft_triang))*1.2;
axis([0 f0*30 0 ylim ])
xlabel('Frecuencia (Hz)');
title(strcat('FFT triangular Simualda  ','    F_D=',string(dist_triang*100),'%'));
grid minor;

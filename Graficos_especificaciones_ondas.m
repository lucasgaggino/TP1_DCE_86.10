clear 
close all

Ts=10e-6;
t=0:Ts:10;
f0=500;
cant_osc_graf=5;
%% **************************SENO***********************************%
wt=f0*2*pi;
seno=sin(wt*t);
seno_ruido=seno+0.1*sin(2*wt*t)+0.1*sin(3*wt*t)+0.1*sin(4*wt*t)+0.1*sin(5*wt*t);

fft_seno=fft(seno);
fft_seno=fft_seno(1:floor(size(t,2)/2));
fft_seno_ruido=fft(seno_ruido);
fft_seno_ruido=fft_seno_ruido(1:floor(size(t,2)/2));

L=size(fft_seno,2);
fft_freq=(0:L-1)/(Ts*L*2);
figure

subplot(2,2,[1,3])
plot(t,seno_ruido,'r','LineWidth',1);
hold on
plot(t,seno,'b','LineWidth',1);
axis([0 cant_osc_graf/f0 -1.2 1.2])
xlabel('tiempo (t)');
ylabel('Amplitud (V)');
grid on
legend('Seno con Ruido','Seno Puro');

subplot(2,2,2)
dist_seno=SignalDistortion(abs(fft_seno),fft_freq,'S',30,false);
axis([0 f0*30 0 6e5 ])
xlabel('Frecuencia (Hz)');
title(strcat('FFT Seno Puro  ','      F_D=',string(dist_seno*100),'%'));
grid minor;

subplot(2,2,4)
dist_seno=SignalDistortion(abs(fft_seno_ruido),fft_freq,'S',30,false);
axis([0 f0*30 0 6e5 ])
xlabel('Frecuencia (Hz)');
grid minor;
title(strcat('FFT Seno con Ruido ','      F_D=',string(dist_seno*100),'%'));


%% ****************************CUADRADA*******************************

cuad=double(sin(wt*t)>=0)*2-1;
s=tf('s');
tau=50e-6;
lp=(1/tau)/(s+1/tau);
cuad_ruido=lsim(lp,cuad,t);

fft_cuad=fft(cuad);
fft_cuad=fft_cuad(1:floor(size(t,2)/2));
fft_cuad_ruido=fft(cuad_ruido);
fft_cuad_ruido=fft_cuad_ruido(1:floor(size(t,2)/2));

L=size(fft_cuad,2);
fft_freq=(0:L-1)/(Ts*L*2);
figure

subplot(2,2,[1,3])
plot(t,cuad_ruido,'r','LineWidth',1);
hold on
plot(t,cuad,'b','LineWidth',1);
axis([0 cant_osc_graf/f0 -1.2 1.2])
xlabel('tiempo (t)');
ylabel('Amplitud (V)');
grid on
legend('Cuadrada Distorsionada','Cuadrada Pura');

subplot(2,2,2)
dist_cuad=SignalDistortion(abs(fft_cuad),fft_freq,'C',15,false);
axis([0 f0*30 0 8e5 ])
xlabel('Frecuencia (Hz)');
title(strcat('FFT Cuadrada Pura  ','      F_D=',string(dist_cuad*100),'%'));
grid minor;

subplot(2,2,4)
dist_cuad=SignalDistortion(abs(fft_cuad_ruido),fft_freq,'C',15,false);
axis([0 f0*30 0 8e5 ])
xlabel('Frecuencia (Hz)');
grid minor;
title(strcat('FFT Cuadrada Distorsionada ','      F_D=',string(dist_cuad*100),'%'));

%% ****************************Triangular*******************************

triang=sawtooth(wt*t,1/2);
s=tf('s');
tau=100e-6;
lp=(1/tau)/(s+1/tau);
triang_ruido=lsim(lp,triang,t);

fft_triang=fft(triang);
fft_triang=fft_triang(1:floor(size(t,2)/2));
fft_triang_ruido=fft(triang_ruido);
fft_triang_ruido=fft_triang_ruido(1:floor(size(t,2)/2));

L=size(fft_triang,2);
fft_freq=(0:L-1)/(Ts*L*2);
figure

subplot(2,2,[1,3])
plot(t,triang_ruido,'r','LineWidth',1);
hold on
plot(t,triang,'b','LineWidth',1);
axis([0 cant_osc_graf/f0 -1.2 1.2])
xlabel('tiempo (t)');
ylabel('Amplitud (V)');
grid on
legend('Triangular Distorsionada','Triangular Pura');

subplot(2,2,2)
dist_triang=SignalDistortion(abs(fft_triang),fft_freq,'T',15,false);
axis([0 f0*30 0 5e5 ])
xlabel('Frecuencia (Hz)');
title(strcat('FFT triangular Pura  ','      F_D=',string(dist_triang*100),'%'));
grid minor;

subplot(2,2,4)
dist_triang=SignalDistortion(abs(fft_triang_ruido),fft_freq,'T',15,false);
axis([0 f0*30 0 5e5 ])
xlabel('Frecuencia (Hz)');
grid minor;
title(strcat('FFT triangular Distorsionada ','      F_D=',string(dist_triang*100),'%'));


clear
close all

A=csvread('fftTRI.DAT',1,0);
freq1=A(:,1);
ffttri=A(:,2);
A=csvread('fftCUA.DAT',1,0);
freq2=A(:,1);
fftcuad=A(:,2);
A=csvread('fftCSIN.DAT',1,0);
freq3=A(:,1);
fftsin=A(:,2);


A=csvread('simTP1.DAT',1,0);
time=A(:,1);
square=A(:,2);
triang=A(:,3);
sine=A(:,5);
figure;
plot(time,sine,'.b');
hold on;
grid on;    
axis([0.1 0.11 -12 12])

Ts=10e-6;
t=0.1:Ts:1.1;
sineINT = interp1(time,sine,t,'spline');
plot(t,sineINT,'or');



figure;
dist_triang=SignalDistortion(ffttri,freq1,'T',15,false)
figure
dist_cuadrada=SignalDistortion(fftcuad,freq2,'C',15,false)
figure
dist_seno=SignalDistortion(fftsin,freq3,'S',30,false)

    



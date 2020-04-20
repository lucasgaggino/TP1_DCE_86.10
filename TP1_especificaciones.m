clear
close all

A=csvread('fftTRI.DAT',1,0);
freq1=A(:,1);
freqtriang1=A(:,2);
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





dist_triang=SignalDistortion(freqtriang1,freq1,'T',25,true)
figure
dist_cuadrada=SignalDistortion(fftcuad,freq2,'C',25,false)
figure
dist_seno=SignalDistortion(fftsin,freq3,'S',15,true)





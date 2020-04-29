%------cargo la data de las sim y la interpolo para darle intervalos de
%tiempo regulares

A=csvread('simTP1.DAT',1,0);
time=A(:,1);
squareSIM=A(:,2);
triangSIM=A(:,3);
sineSIM=A(:,5);


seno = interp1(time,sineSIM,t,'spline');
triang = interp1(time,triangSIM,t,'spline');
cuad = interp1(time,squareSIM,t,'spline');


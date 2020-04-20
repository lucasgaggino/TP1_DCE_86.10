function [f0,position,Amp]=FindFundamentalFreq(freq,fftdata)
[Amp,i]=max(fftdata);
position=i;
f0=freq(i);
end
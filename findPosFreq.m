function pos=findPosFreq(freq,fi,fft_val)
thres=0.01;
[val,pos_aprox]=min(abs(freq-fi));
max_amp=abs(fft_val(pos_aprox));
posi=pos_aprox;
j=0;
pos=pos_aprox;
while (freq(posi+j)<=freq(pos_aprox)*(1+thres))
    if(abs(fft_val(posi+j))>max_amp)
        pos=posi+j;
        max_amp=abs(fft_val(posi+j));
    end
    if(abs(fft_val(posi-j))>max_amp)
        pos=posi-j;
        max_amp=abs(fft_val(posi-j));
    end
    j=j+1;
end

end
function retval=SignalDistortion(FFTsignal,freq,type,nroHarm,dB)
    if(dB==true)
        FFTsignal=10.^(FFTsignal/20);
    end
    n=(3:2:2*nroHarm+1);
    [f0,pos,amp]=FindFundamentalFreq(freq,FFTsignal);
    if(type=='T')
        AnTeo=amp./n.^2;
        fHarm=f0*n;
    end
    if(type=='C')
        AnTeo=amp./n;
        fHarm=f0*n;
    end
    if(type=='S')
        n=2:1:nroHarm+1;
        AnTeo=0./n;
        fHarm=f0*n;
    end
    
    
    acum=zeros(nroHarm,1);
    for i=1:nroHarm
        acum(i)=(AnTeo(i)-FFTsignal(findPosFreq(freq,fHarm(i))) )^2;
    end
    retval=sum(acum)/(amp^2);
    
    loyolagreen = 1/255*[0,104,87];
    plot(freq,FFTsignal);
    hold on;
    plot(fHarm,AnTeo,'ro');
    plot(f0,amp,'o','Color',loyolagreen);
  
    grid on;
    title(strcat('Distorsion=',string(retval*100),'%'))
    xlabel('Frecuencia (Hz)');
    ylabel('Magnitud');
    Legen1='Espectro';
    Legen3=strcat("Fundamental F_0=",string(f0)," Hz");
    Legen2=strcat("Armonicos    cantidad=",string(nroHarm));
    legend(Legen1,Legen2,Legen3);
    
end
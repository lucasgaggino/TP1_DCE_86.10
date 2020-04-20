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
    plot(freq,FFTsignal);
    hold on;
    plot(fHarm,AnTeo,'ro');
end
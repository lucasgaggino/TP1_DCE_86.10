function retval=MagicBox(box)
%matriz 3x3 con digitos del 1 al 9
retval=false;
a=-1*ones(1,3);%suma de filas
b=-1*ones(1,3);%suma de col
d1=sum(diag(box));
d2=sum(diag(fliplr(box)));

for i=1:1:3
    a(i)=sum(box(i,:));
    b(i)=sum(box(:,i));
end

if(d1==d2)
    if(sum(double(a==d2))==3)
        if(sum(double(b==d2))==3)
            retval=true;
            box;
        end
    end
end


       

end
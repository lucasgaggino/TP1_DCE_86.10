
clear
per=perms(1:9);

for i=1:size(per,1)
   A=reshape(per(i,:),3,3);
   if(MagicBox(A))
       A
       pause(1);
       
   end
end 
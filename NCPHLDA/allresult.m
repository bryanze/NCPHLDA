function allresult(disease,lncRNA,interaction,NCP)
a=(interaction-1)*(-1);
NCP=NCP.*a;
[m,n]=size(NCP);
c=find(NCP~=0);
[~,k]=size(c);
p=0;
str=cell(k,3);
for i=1:m
    for j=1:n
        if NCP(i,j)~=0
            p=p+1;
            str(p,1)=disease(i,1);
            str(p,2)=lncRNA(j,1);           
            str{p,3}=NCP(i,j);
        end
    end
end
str=sortrows(str,-3);                     
xlswrite('.\allresult.xlsx',str);
end

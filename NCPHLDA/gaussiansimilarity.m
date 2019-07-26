function [kd,kl] = gaussiansimilarity(interaction,nd,nl)
%A: Binary relations between disease and miRNA, 1st column:miRNA, 2nd column:disease

%calculate gamad for Gaussian kernel calculation
% norm:����interaction��f����    f����Ϊ����A��Frobenius��������Ϊ����A����Ԫ�صľ���ֵƽ�����ܺͣ��ٿ�����
 gamad = nd/(norm(interaction,'fro')^2);

%calculate Gaussian kernel for the similarity between disease: kd
C=interaction;
kd=zeros(nd,nd);
D=C*C';
for i=1:nd
    for j=i:nd
        kd(i,j)=exp(-gamad*(D(i,i)+D(j,j)-2*D(i,j)));
    end
end
kd=kd+kd'-diag(diag(kd));
%��һ�в���
%calculate gamam for Gaussian kernel calculation

gamam = nl/(norm(interaction,'fro')^2);
%calculate Gaussian kernel for the similarity between miRNA: km
kl=zeros(nl,nl);
E=C'*C;
for i=1:nl
    for j=i:nl
        kl(i,j)=exp(-gamam*(E(i,i)+E(j,j)-2*E(i,j)));
    end
end
kl=kl+kl'-diag(diag(kl));
end
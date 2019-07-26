function [NCP]=NCPHMDA(interaction,sd,sl)

[nd,nl]=size(interaction);
NCP_l = zeros(nd,nl)+10^-30;
NCP= zeros(nd,nl);
NCP_d = zeros(nd,nl)+10^-30;

for i = 1:nd
    for j = 1:nl
       NCP_d(i,j)=sd(i,:)*interaction(:,j)/norm(interaction(:,j));
    end
end
for i = 1:nd
      for j = 1:nl
         NCP_l(i,j)=interaction(i,:)*sl(:,j)/norm(interaction(i,:));
     end
end

% for i = 1:nd
%       for j = 1:nl
%          NCP(i,j)=NCP_d(i,j)/norm(sd(i,:));
%      end
% end
% for i = 1:nd
%       for j = 1:nl
%          NCP(i,j)=NCP_l(i,j)/norm(sl(:,j));
%      end
% end
for i= 1:nd
    for j= 1:nl
        NCP(i,j)=NCP_d(i,j)+NCP_l(i,j)/(norm(sd(i,:))+norm(sl(:,j)));
    end
end
end
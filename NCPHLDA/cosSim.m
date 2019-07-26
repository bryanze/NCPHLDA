function [id,il ] = cosSim( interaction )
%COSSIM Summary of this function goes here
%   Detailed explanation goes here
   
rows=size(interaction,1);
id =zeros(rows,rows);
columns = size(interaction,2);
il =zeros(columns, columns );
% 疾病的余弦相似性
    for i=1:rows
        
           for j=1:i
            
            if (norm(interaction(i,:))*norm(interaction(j,:))==0)
                
               id (i,j)=0;
                
            else
                id (i,j)=dot(interaction(i,:),interaction(j,:))/(norm(interaction(i,:))*norm(interaction(j,:)));
                
            end
            
            id (j,i)=id (i,j);
        end
        
        
    end
  
 % lncRNA的余弦相似性
     for i=1:columns 
        
           for j=1:i
            
            if (norm(interaction(:,i))*norm(interaction(:,j))==0)
                
               il (i,j)=0;
                
            else
                il (i,j)=dot(interaction(:,i),interaction(:,j))/(norm(interaction(:,i))*norm(interaction(:,j)));
                
            end
            
            il (j,i)=il (i,j);
        end
        
        
    end
end


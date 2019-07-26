function [auc] = roc_1(deci,label_y,colour)
[threshold,ind] = sort(deci,'descend');
roc_y = label_y(ind);
stack_x = cumsum(roc_y == 0)/sum(roc_y == 0);
stack_y = cumsum(roc_y == 1)/sum(roc_y == 1);
auc=sum((stack_x(2:length(roc_y))-stack_x(1:length(roc_y)-1)).*stack_y(2:length(roc_y)));
auc
plot(stack_x,stack_y,colour);
xlabel('False Positive Rate');
ylabel('True Positive Rate');
hold on;


legend('NCPHLDA(AUC=0.9273)','NCPHLDA with disease space projection only(AUC=0.8976)','NCPHLDA with lncRNA space projection only(AUC=0.8401)');



end

clc,clear;
%% 加载数据
lncRNA_Disease=load('known_lncRNA_disease_interaction.txt');

lncRNA_Disease = lncRNA_Disease';

pre_label_score2 =  getfield(load(['C:\Users\bryanze\Desktop\赵琪\IMCMDA source code\pre_label_score_NCPHLDA_lncRNA_space.mat']),'pre_label_score');
pre_label_score1 =  getfield(load(['C:\Users\bryanze\Desktop\赵琪\IMCMDA source code\pre_label_score_NCPHLDA.mat']),'pre_label_score');
pre_label_score3 =  getfield(load(['C:\Users\bryanze\Desktop\赵琪\IMCMDA source code\pre_label_score_NCPHLDA_disease_space.mat']),'pre_label_score');

%save score_ori_IMC RT; 
label_y = lncRNA_Disease(:);
roc_1(pre_label_score1(:),label_y,'red');
roc_1(pre_label_score2(:),label_y,'green');
roc_1(pre_label_score3(:),label_y,'blue');


title('LOOCV');

saveas(gcf,['对比图.jpg']) ;
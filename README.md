# NCPHLDA
License
Copyright (C) 2019 Zecheng Huang(2111705162@mail2.gdut.edu.cn),Guobo Xie(xiegb@gdut.edu.cn)

Type: Package Title: NCPHLDA:A Novel Method for Human LncRNA-Disease Association Prediction Based on Network Consistency Projection

Description: This package implements the NCPHLDA algorithm, predicting lncRNA-disease associations.

Files: 1.Dataset5

disease_178.xlsx and lncRNA_115.xlsx store lncRNA similarity matrix and disease similarity matrix, respectively;

known_lncRNA_disease_interaction.txt stores known lncRNA-disease association information;

lncRNA_115.txt and diseases_178.txt store lncRNA ids and disease ids, respectively;

2. other files
cosSim.m function computing cosine similarity;

NCPHLDALOOCV.m: function Leave one for cross-validation;

NCPHLDA5KCV.m: function 5-fold cross-validation;

NCPHLDA.m: NCPHLDA core algorithm to predict potential lncRNA-disease associations;


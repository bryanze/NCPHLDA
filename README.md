# NCPHLDA
## License
Copyright (C) 2019 Zecheng Huang(2111705162@mail2.gdut.edu.cn),Guobo Xie(xiegb@gdut.edu.cn)


This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program; if not, see http://www.gnu.org/licenses/.

**Type:** Package Title: NCPHLDA:A Novel Method for Human LncRNA-Disease Association Prediction Based on Network Consistency Projection

**Description:** This package implements the NCPHLDA algorithm, predicting lncRNA-disease associations.


## Requirement
8GB memory
MATLAB R2017a or later

## Related data informations need to first load 

**disease_178.xlsx:** The corresponding names of 178 diseases in adjacency matrix A.   
 
**lncRNA_115.xlsx :** The corresponding names of 115 lncRNAs in adjacency matrix A. 

**lncRNAsimilarity.txt:** The lncRNA expression similarity as the Spearman correlation coefficient between the expression profiles of each lncRNA pair . 

**diseasesimilarity.txt:** The semantic similarities among all diseases.

**known_lncRNA_disease_interaction.txt:** The known lncRNA-disease associations is represented by adjacency matrix A in our method,which shows binary associations between diseases and lncRNAs.1 represents disease j is associated with lncRNA i,otherwise 0.

**lncRNA_115.txt:** The corresponding names of 115 lncRNAs in adjacency matrix A.

**diseases_178.txt:** The corresponding names of 178 diseases in adjacency matrix A.

The Related data informations are placed in the data5 folder.

In order to load related data informations, you should input the appropriate code in the matlab Command Window:

```
[~,disease]=xlsread(['Dataset5\disease_178.xlsx']);
[~,lncRNA]=xlsread(['Dataset5\lncRNA_115.xlsx']);
lncSim = load ('Dataset5\lncRNAsimilarity.txt');
interaction = importdata('Dataset5\known_lncRNA_disease_interaction.txt');
disSim = load('Dataset5\diseasesimilarity.txt');
```

##  Calculate the cosine similarity matrix and integrate 
cosSim.m is used to calculate the cosine similarity of diseases and lncRNA;
integratedsimilarity2.m is used to integrate disease similarity and lncRNA similarity, respectively.
you should input the appropriate code in the matlab Command Window:
```
 [id ,il] = cosSim( interaction );                    % Return the processed cosine similarity matrix
 [sd,sl] = integratedsimilarity2(lncSim,disSim,id,il,0.9);   % Integrated similarity for diseases and lncRNAs
```

## Run NCPHLDA to infer potential associations between lncRNAs and diseases

To analyze these data on NCPHLDA to further infer potential associations between lncRNAs and diseases, you should input the appropriate code in the matlab Command Window:

```
%% Calculated scoring matrix
[NCP]=NCPHLDA(interaction,sd,sl);
%% result
allresult(disease,lncRNA,interaction,NCP);
```

**NCPHLDA.m:** NCPHLDA core algorithm to predict potential lncRNA-disease associations; it corresponds to the part of network  consistency projection in this paper.

**allresult.m:** the predicted results will be automatically saved in the excel table(allresult.xlsx)


## Cross validation

**NCPHLDALOOCV.m:** function Leave one for cross-validation. 

**pre_label_score_NCPHLDA.mat**the prediction score of Leave one for cross-validation.

**NCPHLDA5KCV.m:** function 5-fold cross-validation.

**pre_label_score_NCPHLDA_5kcv.mat**the prediction score of 5-fold cross-validation.

Running  NCPHLDALOOCV.m get the AUC value and ROC chart after implementing Leave one for cross-validation.


Running NCPHLDA5KCV.m get the AUC value and ROC chart after implementing 5-fold cross-validation.

## Self comparison
We performed  Leave one for cross-validation in self comparison.

**pre_label_score_NCPHLDA.mat:** the prediction score in the disease space and lncRNA spase.

**pre_label_score_NCPHLDA_lncRNA_space.mat:** the prediction score in the lncRNA space only.

**pre_label_score_NCPHLDA_disease_space.mat:** the prediction score in the disease space only.

**duibi.m:** the code for self-comparison.

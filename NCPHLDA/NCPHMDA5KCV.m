%% Load data set
lncSim = load ('Dataset5\lncRNAsimilarity.txt');
interaction = importdata ('Dataset5\known_lncRNA_disease_interaction.txt');
disSim = load('Dataset5\diseasesimilarity.txt');
%% Construct two weight matrices
WD=zeros(178);
index = find(0 ~= disSim);
WD(index) = 0.5;
WL=zeros(115);
index1 = find(0 ~= lncSim);
WL(index1) = 0.5;
[nl,nd] = size(interaction);
%% Retain the original correlation matrix and transpose
interaction = interaction';
save interaction interaction;
%% Calculate the cosine similarity matrix and integrate
[id ,il] = cosSim( interaction );                    % Return the processed cosine similarity matrix
[sd,sl] = integratedsimilarity2(lncSim,disSim,id,il,0.5);  % Integrated similarity for diseases and miRNAs   

  
%% Calculated scoring matrix
[NCP]=NCPHLDA(interaction,sd,sl);

%% result
%allresult(disease,lncRNA,interaction,NCP);

%% Five fold cross validation
index_1 = find(1 == interaction);
auc=zeros(1,100);
pp = length(index_1);
   for i = 1 : 100
    i
    indices = crossvalind('Kfold', pp, 5); %Randomly divide the data sample into 5 parts
    for j = 1:5  %Cycle 5 times, take the i-th part as the test sample and the other two parts as the training samples
       
        index_2 = find(j == indices);
        load interaction;
        interaction(index_1(index_2)) = 0;
        [id ,il] = cosSim( interaction);                    
        [sd,sl] = integratedsimilarity2(lncSim,disSim,id,il,0.5); 
        [result]=NCPHLDA(interaction,sd,sl);
        NCP(index_1(index_2)) = result(index_1(index_2)); 
    end
    pre_label_score = NCP(:);
    save pre_label_score_NCPHLDA_5kcv pre_label_score;
    load interaction;
    label_y = interaction(:);
    auc(i) = roc_1(pre_label_score,label_y,'red');

   end
   auc_avg = mean(auc);
   std(auc);
 
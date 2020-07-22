%-------------------------------------------------------------------------%
%  Filter Feature Selection Algorithm source codes demo version           %
%                                                                         %
%  Programmer: Jingwei Too                                                %
%                                                                         %
%  E-Mail: jamesjames868@gmail.com                                        %
%-------------------------------------------------------------------------%


%---Input------------------------------------------------------------------
% feat:  feature vector (instances x features)
% label: labelling 
% nFeat: Pre-determined number of selected features
% kfold: Number of k-fold cross-validation
%---Output-----------------------------------------------------------------
% sFeat: Selected features (instances x features)
% Sf:    Selected feature index
% Nf:    Number of selected features
% Acc:   Classification accuracy
%--------------------------------------------------------------------------

% Compute accuracy using k-nearest neighbor classifier
clc, clear, close 
% Benchmark data set 
load ionosphere.mat; 
% Full features
k=5; kfold=10; Acc=jKNN(feat,label,k,kfold); 
fprintf('\n Accuracy (Full features): %g %%',Acc);


%% (1) Relief-F
clc, clear, close 
% Benchmark data set 
load ionosphere.mat; 
% Parameter setting
nFeat=15; k=5;
% Relief-F
[sFeat,Sf,Nf]=jRF(feat,label,k,nFeat);
% Compute accuracy using k-nearest neighbor classifier
k=5; kfold=10; Acc=jKNN(sFeat,label,k,kfold); 
fprintf('\n Accuracy (Relief-F): %g %%',Acc); 


%% (2) Pearson Correlation Coefficient
clc, clear, close 
% Benchmark data set 
load ionosphere.mat; 
% Parameter setting
nFeat=15;
% Pearson Correlation Coefficient
[sFeat,Sf,Nf]=jPCC(feat,label,nFeat);
% Compute accuracy using k-nearest neighbor classifier
k=5; kfold=10; Acc=jKNN(sFeat,label,k,kfold);
fprintf('\n Accuracy (Pearson Correlation Coefficient): %g %%',Acc); 

%% (3) F-score 
clc, clear, close 
% Benchmark data set 
load ionosphere.mat; 
% Parameter setting
nFeat=15;
% F-score 
[sFeat,Sf,Nf]=jFS(feat,label,nFeat);
% Compute accuracy using k-nearest neighbor classifier
k=5; kfold=10; Acc=jKNN(sFeat,label,k,kfold);
fprintf('\n Accuracy (F-score): %g %%',Acc); 

%% (4) Term Variance 
clc, clear, close 
% Benchmark data set 
load ionosphere.mat; 
% Parameter setting
nFeat=15;
% Term Variance 
[sFeat,Sf,Nf]=jTV(feat,nFeat);
% Compute accuracy using k-nearest neighbor classifier
k=5; kfold=10; Acc=jKNN(sFeat,label,k,kfold);
fprintf('\n Accuracy (Term Variance): %g %%',Acc); 




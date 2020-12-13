% Filter Feature Selection Toolbox 
 
%---Usage-------------------------------------------------------------
% If you wish to use Relief-F (RF) then you may write
% FS = jffs('rf',feat,label,opts);


%---Input-------------------------------------------------------------
% feat    : Feature vector matrix (Instances x Features)
% label   : Label matrix (Instances x 1)
% opts    : Parameter settings 
% opts.Nf : Number of selected features


%---Output------------------------------------------------------------
% FS    : Feature selection model (It contains several results)
% FS.sf : Index of selected features
% FS.ff : Selected features
% FS.nf : Number of selected features
% FS.s  : Weight or score
% Acc   : Accuracy of validation model


%% Example : Relief-F 
% Parameters
opts.K  = 3;     % number of nearest neighbors
opts.Nf = 10;    % select 10 features

% Load dataset
load ionosphere.mat; 

% Perform feature selection 
FS     = jffs('rf',feat,label,opts);

% Define index of selected features
sf_idx = FS.sf;

% Accuracy  
kfold  = 5;
Acc    = mSVM(feat(:,sf_idx),label,kfold);






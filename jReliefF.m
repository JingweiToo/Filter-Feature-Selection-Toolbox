
function RF = jReliefF(feat,label,opts)
% Parameters
num_feat = fix(size(feat,2) / 2); 
K        = 5;

if isfield(opts,'Nf'), num_feat = opts.Nf; end
if isfield(opts,'K'), K = opts.K; end

% Convert format to categorical
label          = categorical(label); 
% Relief-F Algorithm
[rank, weight] = relieff(feat,label,K);
% Select features based on ranking
Sf             = rank(1:num_feat);
sFeat          = feat(:, Sf); 
% Store results 
RF.sf = Sf; 
RF.ff = sFeat; 
RF.nf = num_feat;
RF.f  = feat; 
RF.l  = label;
RF.s  = weight;
end


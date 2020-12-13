%[2014]-"An unsupervised feature selection algorithm based on ant
%colony optimization" (7)

function TVFS = jTermVarianceFeatureSelection(feat,label,opts)
% Parameter
num_feat = fix(size(feat,2) / 2); 

if isfield(opts,'Nf'), num_feat = opts.Nf; end

% Number of features
[num_data, dim] = size(feat);
% Start 
TV = zeros(1,dim);
for d = 1:dim
  % Mean of each feature
  mu    = mean(feat(:,d));
  % Term variance (7)
  TV(d) = (1 / num_data) * sum((feat(:,d) - mu) .^ 2);
end
% Larger value offer better information
[~, rank] = sort(TV,'descend');
% Select features based on selected positions 
Sf        = rank(1:num_feat);
sFeat     = feat(:, Sf);
% Store results
TVFS.sf = Sf; 
TVFS.ff = sFeat; 
TVFS.nf = num_feat; 
TVFS.f  = feat; 
TVFS.l  = label;
TVFS.s  = TV;
end



function NCA = jNeighborhoodComponentAnalysis(feat,label,opts)

if isfield(opts,'Nf'), num_feat = opts.Nf; end

% Perform NCA
model    = fscnca(feat,label);
% Weight
weight   = model.FeatureWeights; 
% Higher weight better features
[~, idx] = sort(weight,'descend');
% Select features based on selected index
Sf       = idx(1:num_feat)';
sFeat    = feat(:,Sf); 
% Store results
NCA.sf = Sf; 
NCA.ff = sFeat;
NCA.nf = num_feat; 
NCA.f  = feat;
NCA.l  = label;
NCA.s  = weight;
end





      
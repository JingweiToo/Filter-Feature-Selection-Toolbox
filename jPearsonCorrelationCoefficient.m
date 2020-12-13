%[2014]-"A Review of Feature Reduction Techniques in Neuroimaging" (1)

function PCC = jPearsonCorrelationCoefficient(feat,label,opts)
% Parameter
num_feat = fix(size(feat,2) / 2); 

if isfield(opts,'Nf'), num_feat = opts.Nf; end

% Mean of feat & label
X_mu      = mean(feat,1); 
Y_mu      = mean(label,1); 
% Substract mean from feat & label
dX        = feat - X_mu; 
dY        = label - Y_mu;
% Numerator & Denominator
nume      = sum((dX .* dY), 1); 
deno      = sqrt(sum(dX .^ 2, 1) .* sum(dY .^2, 1));
% Pearson Correlation Coefficient (1)
pcc       = nume ./ deno; 
% Absolute  
pcc       = abs(pcc);
% Sort pcc from high to low
[~, rank] = sort(pcc,'descend');
% Select features based on selected positions 
Sf        = rank(1:num_feat); 
sFeat     = feat(:, Sf);
% Store results 
PCC.sf = Sf;
PCC.ff = sFeat; 
PCC.nf = num_feat;
PCC.f  = feat;
PCC.l  = label;
PCC.s  = pcc;
end



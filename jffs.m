% Filter Feature Selection Toolbox 

function model = jffs(type,feat,label,opts)
switch type
  case'nca'    ; fun = @jNeighborhoodComponentAnalysis;
  case'pcc'    ; fun = @jPearsonCorrelationCoefficient;
  case'tv'     ; fun = @jTermVarianceFeatureSelection; 
  case'rf'     ; fun = @jReliefF; 
end
tic;
model = fun(feat,label,opts); 
% Computational time
t = toc;

model.t = t;
fprintf('\n Processing Time (s): %f % \n',t); fprintf('\n');
end



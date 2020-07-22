%-------------------------------------------------------------------------%
%  Relief-F (RF) Algorithm source codes demo version                      %
%                                                                         %
%  Programmer: Jingwei Too                                                %
%                                                                         %
%  E-Mail: jamesjames868@gmail.com                                        %
%-------------------------------------------------------------------------%

function [sFeat,Sf,Nf]=jRF(feat,label,k,nFeat)
%---Input------------------------------------------------------------------
% feat:  feature vector (instances x features)
% label: labelling 
% nFeat: Pre-determined number of selected features
%---Output-----------------------------------------------------------------
% sFeat: Selected features (instances x features)
% Sf:    Selected feature index
% Nf:    Number of selected features
%--------------------------------------------------------------------------


label=categorical(label); 
Sf=relieff(feat,label,k);
sFeat=feat(:,Sf(1:nFeat)); Nf=length(Sf); 
end


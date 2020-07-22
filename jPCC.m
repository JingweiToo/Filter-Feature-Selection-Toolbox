%-------------------------------------------------------------------------%
%  Pearson Correlation Coefficient (PCC) source codes demo version        %
%                                                                         %
%  Programmer: Jingwei Too                                                %
%                                                                         %
%  E-Mail: jamesjames868@gmail.com                                        %
%-------------------------------------------------------------------------%

function [sFeat,Sf,Nf]=jPCC(feat,label,nFeat)
%---Input------------------------------------------------------------------
% feat:  feature vector (instances x features)
% label: labelling 
% nFeat: Pre-determined number of selected features
%---Output-----------------------------------------------------------------
% sFeat: Selected features (instances x features)
% Sf:    Selected feature index
% Nf:    Number of selected features
%--------------------------------------------------------------------------


Xmu=mean(feat,1); Ymu=mean(label,1); 
dX=feat-Xmu; dY=label-Ymu;
nume=sum((dX.*dY),1);
deno=sqrt(sum(dX.^2,1).*sum(dY.^2,1));
pcc=nume./deno; 
pcc=abs(pcc);
[~,Sf]=sort(pcc,'descend');
Sf=Sf(1:nFeat); sFeat=feat(:,Sf); Nf=length(Sf);
end



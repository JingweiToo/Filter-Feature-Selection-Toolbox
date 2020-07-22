%-------------------------------------------------------------------------%
%  Term Variance Feature Selection (TV) source codes demo version         %
%                                                                         %
%  Programmer: Jingwei Too                                                %
%                                                                         %
%  E-Mail: jamesjames868@gmail.com                                        %
%-------------------------------------------------------------------------% 

function [sFeat,Sf,Nf]=jTV(feat,nFeat)
%---Input------------------------------------------------------------------
% feat:  feature vector (instances x features)
% nFeat: Pre-determined number of selected features
%---Output-----------------------------------------------------------------
% sFeat: Selected features (instances x features)
% Sf:    Selected feature index
% Nf:    Number of selected features
%--------------------------------------------------------------------------


[I,D]=size(feat);
TermVariance=zeros(1,D); 
for d=1:D
  mu=mean(feat(:,d));
  TermVariance(d)=(1/I)*sum((feat(:,d)-repmat(mu,I,1)).^2);
end
[~,Sf]=sort(TermVariance,'descend');
Sf=Sf(1:nFeat); sFeat=feat(:,Sf); Nf=length(Sf);
end


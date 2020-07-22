%-------------------------------------------------------------------------%
%  F-score Feature Selection (FS) source codes demo version               %
%                                                                         %
%  Programmer: Jingwei Too                                                %
%                                                                         %
%  E-Mail: jamesjames868@gmail.com                                        %
%-------------------------------------------------------------------------% 

function [sFeat,Sf,Nf]=jFS(feat,label,nFeat)
%---Input------------------------------------------------------------------
% feat:  feature vector (instances x features)
% label: labelling 
% nFeat: Pre-determined number of selected features
%---Output-----------------------------------------------------------------
% sFeat: Selected features (instances x features)
% Sf:    Selected feature index
% Nf:    Number of selected features
%--------------------------------------------------------------------------


D=size(feat,2);
class=unique(label); Nc=length(class); 
Fsore=zeros(1,D);
for d=1:D
  Mu=mean(feat(:,d)); 
  mu=zeros(Nc,1); A=zeros(Nc,1); B=zeros(Nc,1); 
  for k=1:Nc
    c=class(k); 
    f=feat(label==c,d); 
    N=length(f); 
    mu(k)=mean(f); 
    A(k)=(mu(k)-Mu)^2;
    B(k)=(1/(N-1))*sum((f-repmat(mu(k),N,1)).^2);
  end 
  Fsore(d)=sum(A)/sum(B);
end
[~,Sf]=sort(Fsore,'descend');
Sf=Sf(1:nFeat); sFeat=feat(:,Sf); Nf=length(Sf);
end





      
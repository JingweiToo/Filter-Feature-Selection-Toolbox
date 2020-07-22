%-------------------------------------------------------------------------%
%  Machine learning algorithms source codes demo version                  %
%                                                                         %
%  Programmer: Jingwei Too                                                %
%                                                                         %
%  E-Mail: jamesjames868@gmail.com                                        %
%-------------------------------------------------------------------------%


function Acc=jKNN(feat,label,k,kfold)
Model=fitcknn(feat,label,'NumNeighbors',k,'Distance','euclidean');
C=crossval(Model,'KFold',kfold);
Afold=100*(1-kfoldLoss(C,'mode','individual'));
Acc=mean(Afold); 
end



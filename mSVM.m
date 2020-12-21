
function Acc = mSVM(feat,label,kfold)  
% Data preparation
fold   = cvpartition(label,'KFold',kfold);
Afold  = zeros(kfold,1);
for i = 1:kfold
  trainIdx = fold.training(i); testIdx = fold.test(i);
  xtrain   = feat(trainIdx,:); ytrain  = label(trainIdx);
  xvalid   = feat(testIdx,:);  yvalid  = label(testIdx); 
  % Train model
  Temp     = templateSVM('KernelFunction','rbf','KernelScale','auto');
  My_Model = fitcecoc(xtrain,ytrain,'Learners',Temp);
  % Test 
  pred = predict(My_Model,xvalid); clear My_Model
  % Accuracy
  Afold(i) = sum(pred == yvalid) / length(yvalid);
end  
% Overall accuracy
Acc = mean(Afold);
 
fprintf('\n Accuracy: %g %%',100 * Acc);
end


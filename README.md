# Jx-FFST : A Filter Feature Selection Toolbox

---
> "Toward Talent Scientist: Sharing and Learning Together"
>  --- [Jingwei Too](https://jingweitoo.wordpress.com/)
---

![Wheel](https://www.mathworks.com/matlabcentral/mlc-downloads/downloads/f5e02324-3814-410d-b47e-a5f4033497dc/41a6d04b-7f52-46f8-9ee6-64fc5be9caa4/images/screenshot.PNG)

## Introduction

* This toolbox contains 4 filter feature selection methods 
* The < A_Main.m file > shows the example of how to use these filter feature selection on the benchmark dataset


## Usage
The main function *jffs* is employed to perform feature selection. You may switch the method by changing the 'rf' to [other abbreviations](/README.md#list-of-available-filter-feature-selection-methods)
* If you wish to use Relief-F ( RF ) then you may write
```code
FS = jffs('rf',feat,label,opts);
```


## Input
* *feat*   : feature vector matrix ( Instance *x* Features )
* *label*  : label matrix ( Instance *x* 1 )
* *opts*   : parameter settings
    + *Nf* : number of selected features ( *must be set for all methods* )


## Output
* *Acc*  : accuracy of validation model
* *FS*   : feature selection model ( It contains several results )
    + *sf* : index of selected features
    + *ff* : selected features
    + *nf* : number of selected features
    + *s*  : weight / score
    + *t*  : computational time (s)
    

### Example : Relief-F  ( RF ) 
```code 
% Parameters
opts.K  = 3;     % number of nearest neighbors
opts.Nf = 10;    % select 10 features

% Load dataset
load ionosphere.mat; 

% Perform feature selection 
FS     = jffs('rf',feat,label,opts);

% Define index of selected features
sf_idx = FS.sf;

% Accuracy  
kfold  = 5;
Acc    = mSVM(feat(:,sf_idx),label,kfold);
```


## Requirement

* MATLAB 2016 or above 
* Statistics and Machine Learning Toolbox


## List of available filter feature selection methods
* The extra parameter represent the parameter other than number of selected features
* Note : Relief-F contains extra parameter to be adjusted. If you do not set the parameter then the algorithm will be executed using default setting
* You can use *opts* to set the parameter
    + *K* : number of nearest neighbors


| No. | Abbreviation | Name                                |  Extra Parameter        |
|-----|--------------|-------------------------------------|-------------------------|
| 4   | 'nca'        | Neighborhood Component Analysis     | -                       |
| 3   | 'rf'         | Relief-F                            | opts.K = 5              |
| 2   | 'tv'         | Term Variance                       | -                       |
| 1   | 'pcc'        | Pearson Correlation Coefficient     | -                       |




    
    
    

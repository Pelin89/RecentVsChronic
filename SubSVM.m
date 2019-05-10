   
    for j=1:100
        warning('off','all');
        j
        idx=randsample(1:256,98);
        
        for i=1:2

            if i==1
              
                [predictorNames, chronic, recent, labels, colNames, labName]=PrepareData('Results.xlsx','13Params_newCorrFrEig');
            end
            
            if i==2
              
                [predictorNames, chronic, recent, labels, colNames, labName]=PrepareData('Results.xlsx','14Params_fractal');
            end
            
         
              
            %idx=randsample(1:size(chronic,1),98);
            subChronic=chronic(idx,:);
            params2=[subChronic;recent];
            %params2=[chronic;recent];

            %labels=randi([0 1], 196,1);

            pTable=array2table(params2,'VariableNames',colNames);
            lTable=array2table(labels,'VariableNames',labName); 


             concatenatedPredictorsAndResponse = [pTable, lTable];

             [trainedClassifierLR, accuracyLR] = LRClassifier(concatenatedPredictorsAndResponse,predictorNames);   
             [trainedClassifierSVMLinear, accuracySVMLinear] = SVMClassifier(concatenatedPredictorsAndResponse,'linear',[],predictorNames);  
             [trainedClassifierSVMPol, accuracySVMPol] = SVMClassifier(concatenatedPredictorsAndResponse,'polynomial',2,predictorNames);  
             [trainedClassifierSVMCub, accuracySVMCub] = SVMClassifier(concatenatedPredictorsAndResponse,'polynomial',3,predictorNames);  
             [trainedClassifierSVMGaus, accuracySVMGaus] = SVMClassifier(concatenatedPredictorsAndResponse,'gaussian',[],predictorNames); 

             validationAccuracyLR(i,j)=accuracyLR*100; 
             validationAccuracySVMLinear(i,j)=accuracySVMLinear*100; 
             validationAccuracySVMPol(i,j)=accuracySVMPol*100; 
             validationAccuracySVMCub(i,j)=accuracySVMCub*100; 
             validationAccuracySVMGaus(i,j)=accuracySVMGaus*100; 
             
        end
    end
    for m=1:2
        FinalAccuracyLR(m)=mean(validationAccuracyLR(m,:));
        FinalAccuracySVMLinear(m)=mean(validationAccuracySVMLinear(m,:));
        FinalAccuracySVMPol(m)=mean(validationAccuracySVMPol(m,:));
        FinalAccuracySVMCub(m)=mean(validationAccuracySVMCub(m,:));
        FinalAccuracySVMGaus(m)=mean(validationAccuracySVMGaus(m,:));
    end

    


function [score] = scoringMatrix(sequence)
    [a1,b1]=seqconsensus(char(sequence),'alphabet','nt','scoringmatrix','nuc44');
    b1(isnan(b1))=0;
    score=mean(b1);
   
end


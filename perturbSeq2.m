function [new_seq,new_freq] = perturbseq2(sequence,freq)

    repeated_seq=char(repelem(sequence,freq));
    %repeated_seq=char(seq.Sequence);
    colSize=size(repeated_seq,1);
    rowSize=size(repeated_seq,2);
    for j=1:rowSize
        col=repeated_seq(:,j);
        seqnew(:,j)=col(randperm(colSize));
        
    end
    
    cellSeq=cellstr(seqnew);
    [occurence,ua,ub]=unique(cellSeq);
    new_freq=histc(ub,1:length(occurence))';
    new_seq=occurence';


end


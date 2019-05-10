function [ent] = entropy(freq)
       total=0;
       for j=1:length(freq)
           freq_entropy=freq(j)/sum(freq);
           total=total-(freq_entropy*log(freq_entropy));
       end
       ent=(total)/(log(length(freq)));
       
end
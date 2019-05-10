%This script takes a folder containing fasta files.
%It calls other functions (parameter functions)
%It gives a matrix of all parameter results.
%rows of matrix -> samples(fasta files)
%columns of matrix -> parameters
    
outbName = 'Acutes_NGS_large';
%outbName = 'Chronics_NGS_large';
files = dir(fullfile(outbName,'*.fas'));
nSamp = size(files,1);

%here the number of parameters (hard coded)
numofParam=14;
Parameters=zeros(nSamp,numofParam);

%Initalization of Parameters
 STDDist=zeros(nSamp,1);
% EpisCoeff=zeros(nSamp,1); 
% MeanDist=zeros(nSamp,1);
% CVDist=zeros(nSamp,1);
% KEntropy=zeros(nSamp,1);
% NucEntropy=zeros(nSamp,1);
% Entropy=zeros(nSamp,1);
% MutationFreq=zeros(nSamp,1);
% ScoringMatrix=zeros(nSamp,1);
% PCAComps=zeros(nSamp,1);
% CorrFREig=zeros(nSamp,1);
% sMetric=zeros(nSamp,1);
% ClusterCoeff=zeros(nSamp,1);
% TransverMut=zeros(nSamp,1);
score_r=zeros(nSamp,1);

nname=cell(nSamp,1);

addpath('C:/Users/picer1/Desktop/RecentVsChronic/Scripts/Scripts_NoTouch/aeolianine-octave-networks-toolbox-d818511');
%addpath('C:/Users/picer1/Desktop/MatlabScripts_NoTouch2/network_scripts')
  
for i=1:nSamp
    i
    warning ('off','all');
    nSamp = size(files,1);
    freq_thr = 0;
    ntoktype = 5;
    dist_thr=1;

    %preparation of the fasta files (gathering sequence, frequency ...)
    [pathstr,name,ext] = fileparts(files(i).name);
    seq_file = [outbName filesep files(i).name];
    [header,sequence] = fastaread(seq_file);
    [seq,freq,subtype] = readSeqFreq(seq_file,freq_thr,ntoktype);
    [nr,nc]=size(char(sequence));
    dvec=pdist(char(seq.Sequence),'hamming');
    len=size(char(seq.Sequence),2);
    D=len*squareform(dvec);
    [seq_pert,freq_pert]=perturbSeq2(sequence,freq);
    [nr_pert,nc_pert]=size(char(seq_pert));
    dvec_pert=pdist(char(seq_pert),'Hamming');
    D_pert=len*squareform(dvec_pert);
    
    nname{i}=name;
    name
    %calling functions
    
%     %STD distance function
     %STDDist(i)=stdDist(dvec);
%     EpisCoeff(i)=STDDist(i)/stdDist(dvec_pert);
%     
%     %MEAN distance function
     MeanDist(i)=meanDist(D);
% 
%     %CV distance function
%     CVDist(i)=cvDist(dvec);
% 
%     
%     %kEntropy function
%     KEntropy(i)=kEntropy(sequence,10);
% 
%     %nucleotide entropy
%     NucEntropy(i)=kEntropy(sequence,1);
% 
%     %Frequency Entropy function
%     Entropy(i)=entropy(freq);
%     
%     %mutation frequency function
%     MutationFreq(i)=mutationFreq(sequence,freq,nr,nc);

    %Scoring Matrix function
    ScoringMatrix(i)=scoringMatrix(sequence);
    score_r(i)=ScoringMatrix(i)/scoringMatrix(seq_pert);
    
%     %PCA components
%     PCAComps(i)=pcaComponents(sequence,dist_thr);
%     
%     %network functions
%     CorrFREig(i)=corrFREig(D,freq);
%     sMetric(i)=sMetrics(sequence,dist_thr)
%     ClusterCoeff(i)=clusterCoeff(sequence,dist_thr);
%  
%     %transversion mutation
%     TransverMut(i)=transverMut(sequence);
   
   
%    Parameters(i,:)=[STDDist(i) EpisCoeff(i) MeanDist(i) CVDist(i) KEntropy(i) NucEntropy(i)...
%                     Entropy(i) MutationFreq(i) ScoringMatrix(i) PCAComps(i) CorrFREig(i)...
%                     sMetric(i) ClusterCoeff(i) TransverMut(i)]

end


    %save(strcat('Parameters20_recent'),'Parameters')
    %save(strcat('Recent_Names'),'names')






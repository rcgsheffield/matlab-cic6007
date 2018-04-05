%beats script

%The following script can run in two ways
% 1. As a repeated for loop
% 2. As for separate tasks (since each loop item is independent)

%%uncomment for SGE task array
%id=getenv('SGE_TASK_ID');  %id is a string variable 
%id='4';
for iid=1:4

    %%comment for SGE task array (this variable is obtained from SGE
    % environment variables)
    id=sprintf('%d',iid);   
    outfile=sprintf('beat%s.mat',id);
    
    %%uncomment for SGE task array
    %iid=sscanf(id,'%d'); %read scaling parameter from job id


    wav1=zeros(20,100);
    t=1:1:100;
    for shift=1:1:20; wav1( shift ,:)=beat_wave(t,1,1,0.05,iid+(shift/20),0); end;
    save(outfile, 'wav1');

end
plotbeats

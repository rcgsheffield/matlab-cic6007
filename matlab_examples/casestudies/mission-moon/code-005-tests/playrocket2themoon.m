function [i,currentstate]=playrocket2themoon(state, control, const,figh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%the program
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
newstate=state;
disp('Starting the simulation at time ');
for i=1:control.nsteps
    newstate=updatestate(newstate, control, const,figh);
end
  currentstate=newstate;
end
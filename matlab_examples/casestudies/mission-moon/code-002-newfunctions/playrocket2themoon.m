pause;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%the program
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:nsteps
 h.XDataSource ='x';
h.YDataSource = 'y';
 hm.XDataSource ='xm';
hm.YDataSource = 'ym';
       %calculate vx
       newvx=vx;
       newvy=vy;
       
       %TODO replace with gravaccel
       r2=((x-xe).^2+(y-ye).^2);
       r=sqrt(r2);
       g=G*me/r2;
       
       gx=g*(x-xe)/r;
       gy=g*(y-ye)/r;
       
       %replace with gravaccel
       r2=((x-xm).^2+(y-ym).^2);
       r=sqrt(r2);
       g=G*mm/r2;
        gx=gx+g*(x-xm)/r;
       gy=gy+g*(y-ym)/r;
      
       
       
       %calculate vy
       newvy=vy-gy*dt;
       newvx=vx-gx*dt;
 
        %store old position vector
        oldr(1,1)=x;
        oldr(1,2)=y;
        
 
      

        
       
       %calculate x
       x=x+0.5*(vx+newvx)*dt;
       
       %calculate y
       y=y+0.5*(vy+newvy)*dt;
       
       
       
             %moon
   %old locator for moon
%       thetam=thetam+dthetam*dt;
%       if thetam>(2*pi)
%          thetam=0; 
%       end
%       xm=dem*cos(thetam);
%       ym=dem*sin(thetam);
       gx=0;
       gy=0;
       [gxt,gyt]=gravaccel(xm,xe,ym,ye,me);%earth contrib
       gx=gx+gxt;
       gy=gy+gyt;
       %update velocity
       newvy=vym-gy*dt;
       newvx=vxm-gx*dt;
       xm=xm+0.5*(vxm+newvx)*dt;
       ym=ym+0.5*(vym+newvy)*dt;
       vxm=newvx;
       vym=newvy; 
       
       
       
       
       
%       refreshdata; 

%       h.XData=x;
%       h.YData=y;
      set(h,'XData',x);
      set(h,'YData',y);

       set(hm,'XData',xm);
      set(hm,'YData',ym);
     
      
      
      drawnow;
       vx=newvx;
       vy=newvy;

        newr(1,1)=x;
        newr(1,2)=y;
 
 %plot( x , y ,'o','MarkerFaceColor','g','MarkerSize',10);
 %hold on;
        %vectarrow(oldr, newr);
%         hold on;

end
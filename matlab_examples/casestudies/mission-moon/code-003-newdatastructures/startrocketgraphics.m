

figure;
hold on;

%figure handles stored in figh

figh.he=plot( 0 , 0 ,'o','MarkerFaceColor','b','MarkerSize',8);
hold on;
figh.h=plot( state.x , state.y ,'o','MarkerFaceColor','g','MarkerSize',4);
hold on;
figh.hm=plot( state.xm , state.ym ,'o','MarkerFaceColor','b','MarkerSize',6);
hold on;




pause;

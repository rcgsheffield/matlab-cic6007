%rocket2
%what rocket2 does

%this rocket will go out of the earths atmosphere

%use newtons law of gravity
%  https://en.wikipedia.org/wiki/Gravitational_constant


%TODO design tests
%TODO tests for gravitational model test each planet, satellite in turn
%TODO test each planet around sun
%TODO test satellite around each planet set initiallisation case to enable
%this

%TODO improved control structure

%TODO functions to be added
%gravaccel, components of the acceleration due to gravity and call these from playrocket2themoon
%dist, distance between two objects e.g. earth-moon, moon-rocket etc...

%TODO Adapt code so that moon moves under gravity using gravaccel
%TODO store system state in a structure
%TODO store constants in a structure
%



clear all %here because variables not initilised correctly :-( :-(  merde!!!

G=6.67e-11; %gravitational constants SI units
re=6.3781e6; %radius of the earth metres
me=5.97237e24; %earth mass kg
mm=7.342e22; %moonmas kg
dem=381.5e6; %dist moon-earth metres
xm=381.5e6; %xpos moon
ym=0; %ypos moon
thetam=0;
dthetam=2*pi/(27*24*3600); %angular velocity of the moon
mr=1000; %not used ?????



G=6.67e-11; %gravitational constants SI units
re=6.3781e6; %radius of the earth metres
me=5.97237e24; %earth mass kg
mm=7.342e22; %moonmas kg
ms=1.99e30; %mass sun
mmars=6.42e23 ; %mass mars
dem=381.5e6; %dist moon-earth metres
xm=381.5e6; %xpos moon
ym=0; %ypos moon
vxm=0; %moon speed in orbit x-direction
vym=1023.1;


xe=0; %x position of earth
ye=0; %y position of earth
vxe=0;% x-speed of the earth
vye=0;%y-speed of the earth
vxm=vxm+vxe; %moon speed in orbit x-direction
vym=vye+1023.1;






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%inputs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nsteps=400000;
dt=1; %time step
%launch angle
theta=0;
% box=20000000;
box=800e6; %include moon
 %theta is in degrees here

%initial speed
u=9000; %metres per second
g=9.81; %acceleration due to gravity

xe=0;
ye=0;

y=re+50000;
x=0;

%convert theta to radians
theta=theta*2*pi/360;

vx=u*cos(theta);
vy=u*sin(theta);


figure;
hold on;
re=re/2; %modification for moon model

hax1=line([-re-box -re-box], [re+box -re-box]);
hax2=line([re+box -re-box], [re+box +re+box]);
hax3=line([re+box re+box], [-re-box +re+box]);
hax4=line([-re-box re+box], [-re-box -re-box]);

  set( hax1 , 'Color' ,'red' );
he=plot( xe , ye ,'o','MarkerFaceColor','r','MarkerSize',30);
hold on;
h=plot( x , y ,'o','MarkerFaceColor','g','MarkerSize',10);
hold on;
hm=plot( xm , ym ,'o','MarkerFaceColor','b','MarkerSize',10);
hold on;


%output



pause;

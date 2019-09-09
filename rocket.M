function dx = rocket(t,x)
% Normalized Differential equation system for the Rocket Example
% the Rocket Example orbiting the earth

Thr=0.1405; md=0.0748865; %Thrust and mass flowrate

% States
r=x(1); u=x(2); v=x(3);

% Costates
lamr=x(4); lamu=x(5); lamv=x(6);

% control input
phi=atan2(lamu,lamv);
inpt=Thr/(1-md*t);

%State equations
v2=v*v;r2=r*r; r3=r*r2;
f1=u;
f2=v2/r-1/r2+inpt*sin(phi);
f3=-u*v/r+inpt*cos(phi);
g1=-lamu*(-v2/r2+2/r3);
g2=-lamr+lamv*v/r;
g3=(-2*lamu*v+lamv*u)/r;

dx=[f1 f2 f3 g1 g2 g3]'; 


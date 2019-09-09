function e = psi (x,tf)

e=zeros(3,1);
% States
r=x(1); u=x(2); v=x(3);

% Costates
lamr=x(4); lamu=x(5); lamv=x(6);

v2=v*v; r2=r*r; rsq=sqrt(r);
e(1)=u;
e(2)=v2*r-1;
e(3)=lamv/(2*r*rsq)-lamr+1;



function  exl=bvpsm(lam,ffun,hfun,t0,tf,x0)

% Function bvp solves a 2 point boundary value problem given
% by dx/dt=f1(t,x,y), dy/dt=f2(t,x,y) subject to initial value
% x(t0)=x0 and final constraint h(x(tf),y(tf))=hf. 
% y0 = bvp(ffun, dffun, hfun, t0, tf, xl0, hf) returns
% the solution to the initial value of y to within a default
% tolerance.
% lam0 = bvp(ffun, dffun, hfun, t0, tf, xl0, hf, tol, gain) 
% returns y(t0) to within the tolerance "tol" specified by 
% user with the update gain gain < 1.
% INPUT:
%	ffun	- String containing name of user supplied problem 
%		  decription. Called by xydot=ffun(t,xy), 
%	          where xy=[x;y] and xydot=[f1;f2].	
%		  
%	dffun	- String containing name of user supplied jacobian
%		  of ffun, that is dffun=dffun/dxy. Called by
%		  df=dffun(t,xy).	
%	hfun	- String containing name of user supplied function
%		  for the end boundary condition and its Jacobian.
%		  Called by [h,dh]=hfun(xy,hf).
%	t0	- Initial time
%	tf	- Final time
%	xy0	- [x;y] at t=t0, where y(t0) is an initial guess.
%
%OUTPUT:
%	y0	- Returned solution to the BVP problem.
%
%
% Use ODE45 to get the state trajectory between t0 and tf:
% Called by [tout,xyout]=ode45(ffun,t0,tf,[x0;y0],tol)

%	Written by N. Sadegh, 4/27/94

n=length(x0);
xl=[x0;lam];
[T,X]=feval('ode45',ffun,[t0 tf],xl);
xlf=X(length(X),:)';
exl=feval(hfun,xlf);

%Script file to run the rocket example
%Rocket Example
close all
clear all
OPTIONS=optimset('fsolve');
x0=[1 0 1]'; l0=[1 1 1]'; 
t0=0; tf=3;
l0=fsolve('bvpsm',l0,OPTIONS,'rocket','psi',t0,tf,x0);
[T,X]=ode45('rocket',[0:0.1:3],[x0;l0]);

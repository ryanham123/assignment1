
%% Script that runs the simulation for Part1:Electron Modelling 
% The following calculates thermal velocity and mean free path

clear all
clc
close all

global tstep
global setting

%choose what want to plot
%setting=1;%2-D plot of particle trajectories
setting=2;% Temperature plot

%initial parameters and constants
watchplot=false;
pausetime=0.001;
mass=0.26*9.1093*10^(-31);
kbolts=1.380*10^(-23);

%set tempature to 300K
T=300;

%set mean time between collisions

MTBC=0.2e-12;



%calculate thermal velocity
thermalVelo=(kbolts*T/mass)^(0.5);

fprintf('The calculated thermal velocity is %7.2f m/s \n',thermalVelo)


%calculate mean free path
MFP=MTBC*thermalVelo*(2^0.5);

fprintf('The calculated mean free path is %7.4s m \n',MFP)




